package com.github.tangyi.user.config;

import com.github.tobato.fastdfs.conn.ConnectionPoolConfig;
import com.github.tobato.fastdfs.conn.FdfsConnectionPool;
import com.github.tobato.fastdfs.conn.PooledConnectionFactory;
import com.github.tobato.fastdfs.conn.TrackerConnectionManager;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableMBeanExport;
import org.springframework.jmx.support.RegistrationPolicy;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * fastDfs配置
 *
 * @author tangyi
 * @date 2018-01-05-14:45
 */
@Configuration
@ComponentScan(basePackages = {"com.github.tobato.fastdfs.service", "com.github.tobato.fastdfs.domain"})
@EnableMBeanExport(registration = RegistrationPolicy.IGNORE_EXISTING)   // 解决jmx重复注册bean的问题
public class FastDfsConfig {

    @Value("${fdfs.pool.maxTotal:30}")
    private String maxTotal;

    @Value("${fdfs.pool.maxTotalPerKey:30}")
    private String maxTotalPerKey;

    @Value("${fdfs.pool.maxWaitMillis:10000}")
    private String maxWaitMillis;

    @Value("${fdfs.trackerList:}")
    private String trackerList;

    /* 默认的tracker url */
    private static final String DEFAULT_TRACKER_URL = "127.0.0.1:22122";

    /**
     * 配置连接管理器
     *
     * @param fdfsConnectionPool fdfsConnectionPool
     * @return TrackerConnectionManager
     * @author tangyi
     * @date 2018/1/5 15:33
     */
    @Bean
    public TrackerConnectionManager trackerConnectionManager(FdfsConnectionPool fdfsConnectionPool) {
        TrackerConnectionManager trackerConnectionManager = new TrackerConnectionManager();
        trackerConnectionManager.setPool(fdfsConnectionPool);
        trackerConnectionManager.setTrackerList(getTrackerList());  // 设置tracker地址列表
        return trackerConnectionManager;
    }

    /**
     * 配置连接工厂
     *
     * @return PooledConnectionFactory
     * @author tangyi
     * @date 2018/1/5 15:58
     */
    @Bean
    public PooledConnectionFactory pooledConnectionFactory() {
        return new PooledConnectionFactory();
    }

    /**
     * 配置连接池
     *
     * @param pooledConnectionFactory pooledConnectionFactory
     * @param connectionPoolConfig    connectionPoolConfig
     * @return FdfsConnectionPool
     * @author tangyi
     * @date 2018/1/5 15:33
     */
    @Bean
    public FdfsConnectionPool fdfsConnectionPool(PooledConnectionFactory pooledConnectionFactory, ConnectionPoolConfig connectionPoolConfig) {
        return new FdfsConnectionPool(pooledConnectionFactory, connectionPoolConfig);
    }

    /**
     * 配置连接参数
     *
     * @return ConnectionPoolConfig
     * @author tangyi
     * @date 2018/1/5 15:33
     */
    @Bean
    public ConnectionPoolConfig connectionPoolConfig() {
        ConnectionPoolConfig connectionPoolConfig = new ConnectionPoolConfig();
        connectionPoolConfig.setMaxTotal(Integer.parseInt(maxTotal));
        connectionPoolConfig.setMaxWaitMillis(Long.parseLong(maxWaitMillis));
        connectionPoolConfig.setMaxTotalPerKey(Integer.parseInt(maxTotalPerKey));
        return connectionPoolConfig;
    }

    /**
     * 获取tracker地址列表
     *
     * @return List
     * @author tangyi
     * @date 2018/1/5 15:36
     */
    public List<String> getTrackerList() throws BeansException {
        List<String> trackList;
        if (StringUtils.isNotEmpty(trackerList)) {
            trackList = Arrays.asList(trackerList.split(","));
        } else {
            trackList = Collections.singletonList(DEFAULT_TRACKER_URL);
        }
        return trackList;
    }
}
