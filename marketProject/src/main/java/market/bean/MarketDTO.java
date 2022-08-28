package market.bean;

public class MarketDTO {
	private int seq;			// 글번호
	private String id; 			// 작성자id
	private String city; 		// 시
	private String gu; 			// 구 
	private String title; 		// 제목
	private int price; 			// 단가
	private String content; 	// 내용
	private String image; 		// 제품사진
	private String image2; 		// 제품사진
	private String image3; 		// 제품사진
	private int hit;			//조회수
	private int re_ref;				//원글 번호값과 동일
	private int re_seq;				//답글의 정렬을 위한 seq변수
	private int re_lev;				//number not null,
	private String logtime; 	// 작성일
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	@Override
	public String toString() {
		return "MarketDTO [seq=" + seq + ", id=" + id + ", city=" + city + ", gu=" + gu + ", title=" + title
				+ ", price=" + price + ", content=" + content + ", image=" + image + ", image2=" + image2 + ", image3="
				+ image3 + ", hit=" + hit + ", re_ref=" + re_ref + ", re_seq=" + re_seq + ", re_lev=" + re_lev
				+ ", logtime=" + logtime + "]";
	}
	
	
	

}
