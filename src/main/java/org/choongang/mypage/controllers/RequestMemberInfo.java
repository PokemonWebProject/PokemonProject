package org.choongang.mypage.controllers;

import lombok.Data;

@Data
public class RequestMemberInfo {
    private String userName;
    private String password;
    private String confirmPassword;
    private long myPokemonSeq;
}
