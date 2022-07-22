package comment;

import java.sql.Timestamp;

public class CommentDTO {
	private int boardID;
	private String userID;
	private int commentID;
	private String content;
	private Timestamp commetDate;
	
	
	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
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
	public Timestamp getCommetDate() {
		return commetDate;
	}
	public void setCommetDate(Timestamp commetDate) {
		this.commetDate = commetDate;
	}
	
	
	
}
