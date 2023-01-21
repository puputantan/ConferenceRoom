package com.hbu.utils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class RedisConnect {
    //Redis serve IP
    private static String ADDR = "127.0.0.1";
    //Redis port number
    private static Integer PORT = 6379;
    //Access password Write if you have it, leave it blank if you don’t have it
    private static String AUTH="123456";

    //The maximum number of available connection instances, the default is 8;
    //If the assignment value is -1, it means unlimited. If the pool has allocated maxActive jedis instances, the state of the pool is exhausted (exhausted)
    private static Integer MAX_TOTAL = 1024;
    //Control the maximum number of idle jedis instances in a pool, the default value is 8
    private static Integer MAX_IDLE = 200;
    //The maximum time to wait for an available connection, in milliseconds, the default value is -1, which means never timeout.
    //If the waiting time is exceeded, JedisConnectionException is thrown directly
    private static Integer MAX_WAIT_MILLIS = 10000;
    private static Integer TIMEOUT = 10000;
    //When borrowing (using) a jedis instance, whether to perform the validate (verify) operation in advance;
    //If true, all jedis instances obtained are available
    private static Boolean TEST_ON_BORROW = true;
    private  static JedisPool jedisPool = null;

    /**
     * Static block, initialize Redis connection pool
     */
    static {
        try {
            JedisPoolConfig config = new JedisPoolConfig();
        /*Notice:
             In the higher version of the jedis jar package, such as this version 2.9.0, JedisPoolConfig has no setMaxActive and setMaxWait attributes
             This is because this method is officially deprecated in higher versions and replaced with the following two attributes.
             maxActive ==> maxTotal
             maxWait ==> maxWaitMillis
         */
            config.setMaxTotal(MAX_TOTAL);
            config.setMaxIdle(MAX_IDLE);
            config.setMaxWaitMillis(MAX_WAIT_MILLIS);
            config.setTestOnBorrow(TEST_ON_BORROW);
            jedisPool = new JedisPool(config,ADDR,PORT,TIMEOUT,AUTH);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * Get a Jedis instance
     * @return
     */
    public synchronized static Jedis getJedis(){
        try {
            if(jedisPool != null){
                Jedis jedis = jedisPool.getResource();
                return jedis;
            }else{
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void returnResource(final Jedis jedis){
        //A method parameter is declared final, meaning it is read-only.
        if(jedis!=null){
            jedisPool.returnResource(jedis);
            //jedis.close()Replace jedisPool.returnResource(jedis) method will start from version 3.0
            //jedis.close();
        }
    }
    //Test whether the redis connection is successful, if it is "PONG", it means the connection is successful
    public static void main(String[] args) {
        Jedis jedis = new Jedis(ADDR,6379);
        jedis.auth("123456");
        System.out.println(jedis.ping());
    }
}


