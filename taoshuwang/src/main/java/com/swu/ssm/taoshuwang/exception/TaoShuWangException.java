package com.swu.ssm.taoshuwang.exception;


import com.swu.ssm.taoshuwang.constants.BookEnum;

public class TaoShuWangException extends RuntimeException{

    private BookEnum bookEnum;

    public TaoShuWangException(BookEnum bookEnum){
        super(bookEnum.getMess());
        this.bookEnum = bookEnum;
    }
}
