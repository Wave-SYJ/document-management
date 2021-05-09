package cn.edu.seu.cose.docmanage.exception;

public class SimpleException extends RuntimeException {
    private static final long serialVersionUID = -4004661059108250608L;

    public SimpleException(String message) {
        super(message);
    }
}
