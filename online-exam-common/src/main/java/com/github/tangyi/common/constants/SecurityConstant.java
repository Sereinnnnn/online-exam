package com.github.tangyi.common.constants;

/**
 * @author tangyi
 * @date 2018-08-25-14:08
 */
public class SecurityConstant {

    /**
     * 前缀
     */
    public static final String EXAM_PREFIX = "exam_";

    /**
     * 项目的license
     */
    public static final String GITHUB_LICENSE = "made by github";

    /**
     * 基础角色
     */
    public static final String BASE_ROLE = "ROLE_USER";

    /**
     * sys_oauth_client_details 表的字段，不包括client_id、client_secret
     */
    private static final String CLIENT_FIELDS = "client_id, client_secret, resource_ids, scope, "
            + "authorized_grant_types, web_server_redirect_uri, authorities, access_token_validity, "
            + "refresh_token_validity, additional_information, autoapprove";

    /**
     * JdbcClientDetailsService 查询语句
     */
    private static final String BASE_FIND_STATEMENT = "select " + CLIENT_FIELDS
            + " from sys_oauth_client_details";

    /**
     * 默认的查询语句
     */
    public static final String DEFAULT_FIND_STATEMENT = BASE_FIND_STATEMENT + " order by client_id";

    /**
     * 按条件client_id 查询
     */
    public static final String DEFAULT_SELECT_STATEMENT = BASE_FIND_STATEMENT + " where client_id = ?";

    /**
     * 用户信息头
     */
    public static final String USER_HEADER = "x-user-header";

    /**
     * 角色信息头
     */
    public static final String ROLE_HEADER = "x-role-header";
}
