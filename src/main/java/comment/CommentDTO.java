package comment;

import java.sql.Timestamp;

public class CommentDTO {
	private String userID;
	private int commentID;
	private String content;
	private int num;
	private int commentAvailable;
	private Timestamp commetDate;
	
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCommentAvailable() {
		return commentAvailable;
	}
	public void setCommentAvailable(int commentAvailable) {
		this.commentAvailable = commentAvailable;
	}
	public Timestamp getCommetDate() {
		return commetDate;
	}
	public void setCommetDate(Timestamp commetDate) {
		this.commetDate = commetDate;
	}

	
	
}
