package my.service.copy;

public class MessageNotFoundException extends ServiceException {
	public MessageNotFoundException(String message){
		super(message);  //super? ServiceException
	}
}
