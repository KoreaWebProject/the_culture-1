package korea.it.culture.qna.vo;

public class QnaVO {
	String user_id, qna_title, qna_contents, qna_regdate;
	int qna_id, qna_status, qna_remove_lev, qna_public_lev;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_contents() {
		return qna_contents;
	}
	public void setQna_contents(String qna_contents) {
		this.qna_contents = qna_contents;
	}
	public String getQna_regdate() {
		return qna_regdate;
	}
	public void setQna_regdate(String qna_regdate) {
		this.qna_regdate = qna_regdate;
	}
	public int getQna_id() {
		return qna_id;
	}
	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}
	public int getQna_status() {
		return qna_status;
	}
	public void setQna_status(int qna_status) {
		this.qna_status = qna_status;
	}
	public int getQna_remove_lev() {
		return qna_remove_lev;
	}
	public void setQna_remove_lev(int qna_remove_lev) {
		this.qna_remove_lev = qna_remove_lev;
	}
	public int getQna_public_lev() {
		return qna_public_lev;
	}
	public void setQna_public_lev(int qna_public_lev) {
		this.qna_public_lev = qna_public_lev;
	}
}
