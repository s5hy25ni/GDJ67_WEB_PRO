package com.hr.pro.ctrl;


import java.util.Random;

import com.google.common.base.Charsets;
import com.google.common.hash.HashCode;
import com.google.common.hash.Hasher;
import com.google.common.hash.Hashing;

public class test {

	
	public static void main(String[] args) {
        String password = "1234";
        String password2 = "qwer";

        
        Hasher hasher = Hashing.sha256().newHasher();
        hasher.putString(password, Charsets.UTF_8);
        HashCode sha256 = hasher.hash();
        
        Hasher hasher2 = Hashing.sha256().newHasher();
        hasher2.putString(password2, Charsets.UTF_8);
        HashCode sha2562 = hasher2.hash();

        System.out.println(sha256);
        System.out.println(sha2562);

	}

}
