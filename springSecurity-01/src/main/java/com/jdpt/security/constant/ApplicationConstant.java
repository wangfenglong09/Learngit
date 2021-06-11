package com.jdpt.security.constant;

/**
 * 系统常量类
 */
public class ApplicationConstant
{
    /**登录标志**/
    public static final String LOGIN_FLAG = "login_flag";

    public final static String CUSTOMER_SESSION = "customer_session";

    public final static String CUSTOMER_NAME = "customer_name";

    /**cookie的key**/
    public static final String DL_SHOP = "dlShop";

    /**购物车商品总数量**/
    public static final String SHOPPING_COUNT = "shopping_count";

    /**购物车商品列表**/
    public static final String SHOPPING_CART_LIST = "shoppingCartList";

    /**返回的URL**/
    public static final String RETURN_URL = "returnURL";

    /**
     * 商品状态常量
     */
    //已发布
    public static final String PRODUCT_STATUS_NORMAL = "1";
    //未发布
    public static final String PRODUCT_STATUS_ABNORMAL = "0";
    //失效
    public static final String PRODUCT_STATUS_INVALID = "2";

    /**
     * 购物车中商品下单状态
     * 0：未下单
     * 1：已下单
     */
    public static final String SHOP_CART_PRODUCT_STATUS_UNCOMMITTED = "0";
    public static final String SHOP_CART_PRODUCT_STATUS_COMMITTED= "1";
}
