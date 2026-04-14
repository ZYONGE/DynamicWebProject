package my.service.copy;

public class BadPasswordException extends ServiceException {
	public BadPasswordException(String message){
		super(message);  //super? ServiceException
	}
}
