package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("agreeDTO")
public class AgreeDTO {
	private String id;
	private String agree_divsion_cd;
	private String agree_contents_cd;
	private String agreeYn;
	private String crater;
	private String modifier;
	
	public AgreeDTO() {}

	public AgreeDTO(String id, String agree_divsion_cd, String agree_contents_cd, String agreeYn, String crater,
			String modifier) {
		super();
		this.id = id;
		this.agree_divsion_cd = agree_divsion_cd;
		this.agree_contents_cd = agree_contents_cd;
		this.agreeYn = agreeYn;
		this.crater = crater;
		this.modifier = modifier;
	}

	@Override
	public String toString() {
		return "AgreeDTO [id=" + id + ", agree_divsion_cd=" + agree_divsion_cd + ", agree_contents_cd="
				+ agree_contents_cd + ", agreeYn=" + agreeYn + ", crater=" + crater + ", modifier=" + modifier + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAgree_divsion_cd() {
		return agree_divsion_cd;
	}

	public void setAgree_divsion_cd(String agree_divsion_cd) {
		this.agree_divsion_cd = agree_divsion_cd;
	}

	public String getAgree_contents_cd() {
		return agree_contents_cd;
	}

	public void setAgree_contents_cd(String agree_contents_cd) {
		this.agree_contents_cd = agree_contents_cd;
	}

	public String getAgreeYn() {
		return agreeYn;
	}

	public void setAgreeYn(String agreeYn) {
		this.agreeYn = agreeYn;
	}

	public String getCrater() {
		return crater;
	}

	public void setCrater(String crater) {
		this.crater = crater;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	
	
}