package com.example.financeManager.utils;

/**
 * @version 1.0
 * @file Md5Util
 * @Description: TODO MD5加密工具类
 * @Author 袁陈翔
 * @Date: 2023/4/13
 */
public class Md5Util {
    /**
     * 得到md5加密
     *
     * @param password 密码
     * @return {@link String}
     */
    public String getMD5(String password) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(password.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
        }
        return null;
    }
}
