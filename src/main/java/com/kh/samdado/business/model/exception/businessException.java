package com.kh.samdado.business.model.exception;

public class businessException extends RuntimeException {
	
	public businessException() {}
	
	public businessException(String message) {
		super(message);
	}

}
