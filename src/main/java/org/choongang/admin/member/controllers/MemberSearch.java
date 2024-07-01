package org.choongang.admin.member.controllers;

import lombok.Data;

@Data
public class MemberSearch {
    private int page;
    private int limit;
    private int offset;
    private int endRows;

    private String email;
    private String userName;
    private String skey;
}
