package com.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.AgreeDAO;
import com.dao.CodesDAO;
import com.dao.MemberDAO;
import com.dto.AgreeDTO;
import com.dto.MemberDTO;
import com.dto.RegistrationDTO;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO mDAO;
	@Inject
	AgreeDAO aDAO;
	@Inject
	CodesDAO cDAO;
	// 회원가입
	@Override
	@Transactional(rollbackFor= {Exception.class})
	public void memberIns(RegistrationDTO rDTO) throws Exception {
		try {
			
			MemberDTO mDTO = new MemberDTO();
			mDTO.setId(rDTO.getId());
			mDTO.setPw(rDTO.getPw());
			mDTO.setName(rDTO.getName());
			mDTO.setBirth(rDTO.getBirth());
			mDTO.setPhone(rDTO.getPhone());
			mDTO.setPost(rDTO.getPost());
			mDTO.setAddr1(rDTO.getAddr1());
			mDTO.setAddr2(rDTO.getAddr2());
			mDTO.setCrater(rDTO.getId());
			mDTO.setModifier(rDTO.getId());
			
			System.out.println("mDTO===" + mDTO);
			
			mDAO.memberIns(mDTO);
			
			//코드테이블
			final String AGREE_DIVSION_CD 	= "00002"; //동의구분(회원가입)
			final String AGREE_CONTENTS_CD 	= "00003"; //동의내용
		
			List<String> list = cDAO.codesSel(AGREE_CONTENTS_CD);	//[이용약관 동의,개인정보 수집,개인정보 이용,이벤트 수신 동의]
			System.out.println("lsit ===" + list);
			
			AgreeDTO aDTO = new AgreeDTO();
			aDTO.setId(rDTO.getId());
			aDTO.setAgree_divsion_cd(AGREE_DIVSION_CD);
			aDTO.setCrater(rDTO.getId());
			aDTO.setModifier(rDTO.getId());
				
			for (int i = 0; i < list.size(); i++) {
				
				aDTO.setAgree_contents_cd(list.get(i));
				aDTO.setAgreeYn("N");
				for (int j = 0; j < rDTO.getAgree().size(); j++) {	//화면에서 받아온 동의체크값들[1,2,3]
					if( Integer.toString(i + 1).equals(rDTO.getAgree().get(j))) {
						aDTO.setAgreeYn("Y");
						break;
					}
				}
				
				aDAO.agreeIns(aDTO);
				
			}
		
		
		} catch (Exception e) {
			
			e.printStackTrace();
			System.out.println("캐치문이 실행");
			
		}
		
	}

	// 로그인 완료 후 화면
	@Override
	public String loginCheck(MemberDTO mDTO, HttpSession session) {
		// 로그인 성공햇으면 name값이 넘어오고 아니면 null값이 넘어옴
		String name = mDAO.loginCheck(mDTO, session);
		if(name != null) {
			// 세션에 변수 등록
			session.setAttribute("id", mDTO.getId());
			session.setAttribute("userName", name);
		}
		return name;
	}

	
	@Value("#{api['kakao_client_id']}")
	String kakao_client_id;
	
	// 카카오API - 토근 받아 로그인
	@Override
  	public String getAccessToken(String authorize_code) {
	String accessToken = "";
	String refreshToken = "";
	String reqURL = "https://kauth.kakao.com/oauth/token";
	
	try {
		// URL클래스를 이용하여 연결된 상대편으로부터 데이터를 읽을 때
		URL url = new URL(reqURL);
		// URL클래스의 openConnection()메서드를 이용해서 객체를 생성해야함
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		
		// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
		// 버퍼를 이용하여 읽고쓰는 함수 -> 키보드의 입력이 있을때마다 한 문자씩 버퍼로 전송
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		sb.append("grant_type=authorization_code");
        sb.append("&client_id="+kakao_client_id);
        sb.append("&redirect_uri=http://localhost:8080/joinfolia/member/loginKakao");
        sb.append("&code=" + authorize_code);
        bw.write(sb.toString());
        bw.flush();
        
        //결과 코드가 200이라면 성공
        int responseCode = conn.getResponseCode();
        System.out.println("responseCode: " +  responseCode);
        
        //요청을 통해 얻은 JSON타입의 Response메세지 읽어오기
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String line = "";
        String result = "";
        
        while((line = br.readLine()) != null) { // 한 행씩 읽기
        	result += line;
        }
        
        System.out.println("response body: " + result);
        
        // Json라이브러리에 포함된 클래스로 JSON파싱 객체 생성
        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(result);
        
        accessToken = element.getAsJsonObject().get("access_token").getAsString();
        refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
        
        System.out.println("access_token : " + accessToken);
        System.out.println("refresh_token : " + refreshToken);
        
        br.close();
        bw.close();
	} catch (IOException e) {
		e.printStackTrace();
	}
	
	return accessToken;
	}
	
	
	// 카카오API - 정보추출
	@Override
	public HashMap<String, Object> getUserInfo(String access_token){
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer "  + access_token);
			//결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			//요청을 통해 얻은 JSON타입의 Response메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			
			System.out.println("response body : " + result);
			
			// Json라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            userInfo.put("email", email);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	// 마이페이지
	@Override
	public MemberDTO mypage(String id) {
		return mDAO.mypage(id);
	}

	@Override
	public void memberUpdate(MemberDTO mDTO) {
		mDAO.memberUpdate(mDTO);
	}
	
	
	
	

	
	


	
	

}
