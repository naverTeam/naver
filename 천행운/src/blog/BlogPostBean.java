package blog;

public class BlogPostBean {
	private int postNo;
	private String postTitle;
	private String postText;
	private int postCNum;
	private String postTopic;
	private String postDate;
	private String postImg;
	private int postView;
	private int postLike;
	
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getPostView() {
		return postView;
	}
	public void setPostView(int postView) {
		this.postView = postView;
	}
	public String getPostImg() {
		return postImg;
	}
	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostText() {
		return postText;
	}
	public void setPostText(String postText) {
		this.postText = postText;
	}
	public int getPostCNum() {
		return postCNum;
	}
	public void setPostCNum(int postCNum) {
		this.postCNum = postCNum;
	}
	public String getPostTopic() {
		return postTopic;
	}
	public void setPostTopic(String postTopic) {
		this.postTopic = postTopic;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public int getPostLike() {
		return postLike;
	}
	public void setPostLike(int postLike) {
		this.postLike = postLike;
	}
}
