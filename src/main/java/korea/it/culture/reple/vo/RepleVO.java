package korea.it.culture.reple.vo;

public class RepleVO {
	private int reple_id, reple_remove_lev, reple_good;
	private String user_id, play_id, reple_contents, reple_regdate, reple_update, play_prfnm;
	public double reple_rating;

	public int getReple_id() {
		return reple_id;
	}

	public void setReple_id(int reple_id) {
		this.reple_id = reple_id;
	}

	public double getReple_rating() {
		return reple_rating;
	}

	public void setReple_rating(double reple_rating) {
		this.reple_rating = reple_rating;
	}

	public int getReple_remove_lev() {
		return reple_remove_lev;
	}

	public void setReple_remove_lev(int reple_remove_lev) {
		this.reple_remove_lev = reple_remove_lev;
	}

	public int getReple_good() {
		return reple_good;
	}

	public void setReple_good(int reple_good) {
		this.reple_good = reple_good;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPlay_id() {
		return play_id;
	}

	public void setPlay_id(String play_id) {
		this.play_id = play_id;
	}
	public String getReple_contents() {
		return reple_contents;
	}

	public void setReple_contents(String reple_contents) {
		this.reple_contents = reple_contents;
	}

	public String getReple_regdate() {
		return reple_regdate;
	}

	public void setReple_regdate(String reple_regdate) {
		this.reple_regdate = reple_regdate;
	}

	public String getReple_update() {
		return reple_update;
	}

	public void setReple_update(String reple_update) {
		this.reple_update = reple_update;
	}

	public String getPlay_prfnm() {
		return play_prfnm;
	}

	public void setPlay_prfnm(String play_prfnm) {
		this.play_prfnm = play_prfnm;
	}
}
