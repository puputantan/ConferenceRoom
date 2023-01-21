 package com.hbu.utils;
 import java.util.List;
 import java.util.Map;
 import java.util.Set;
 import org.apache.log4j.Logger;

import redis.clients.jedis.BinaryClient.LIST_POSITION;
import redis.clients.jedis.Jedis;
 import redis.clients.jedis.JedisPool;
 import redis.clients.jedis.JedisPoolConfig;
/**
 * Redis tool class
 * Call format: RedisUtil.getRu().method
  */
 public class RedisUtil {  
    private static RedisUtil ru = new RedisUtil();
    private static Logger logger = Logger.getLogger(RedisUtil.class);

    //Redis server IP
    private static String ADDR = "127.0.0.1";
    //Redis port number
    private static Integer PORT = 6379;
    //Access password Write if you have it, leave it blank if you don’t have it
    private static String AUTH="123456";

    //The maximum number of available connection instances, the default is 8;
    //If the assignment value is -1, it means no limit. If the pool has allocated maxActive jedis instances, the state of the pool is exhausted (exhausted)
    private static Integer MAX_TOTAL = 1024;
    //Control how many idle jedis instances a pool has at most, the default value is 8
    private static Integer MAX_IDLE = 200;
    //The maximum time to wait for an available connection, in milliseconds, the default value is -1, which means never timeout.
    //If the waiting time is exceeded, JedisConnectionException is thrown directly
    private static Integer MAX_WAIT_MILLIS = 10000;
    private static Integer TIMEOUT = 10000;
    //When borrowing (using) a jedis instance, whether to perform the validate (verify) operation in advance;
    //If true, all jedis instances obtained are available
    private static Boolean TEST_ON_BORROW = true;
    private  static JedisPool pool = null;

    /**
     * Static block, initialize Redis connection pool
     */
    static {
        try {
            JedisPoolConfig config = new JedisPoolConfig();
        /*Notice：
            In the higher version of the jedis jar package, such as this version 2.9.0, JedisPoolConfig has no setMaxActive and setMaxWait attributes
             This is because this method is officially deprecated in higher versions and replaced with the following two attributes.
             maxActive ==> maxTotal
             maxWait ==> maxWaitMillis
         */
            config.setMaxTotal(MAX_TOTAL);
            config.setMaxIdle(MAX_IDLE);
            config.setMaxWaitMillis(MAX_WAIT_MILLIS);
            config.setTestOnBorrow(TEST_ON_BORROW);
            pool = new JedisPool(config,ADDR,PORT,TIMEOUT,AUTH);
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
            if(pool != null){
                Jedis jedis = pool.getResource();
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
        // The method parameter is declared final, meaning it is read-only.
        if(jedis!=null){
            pool. returnResource(jedis);
            //jedis.close() replaces jedisPool.returnResource(jedis) method to start with version 3.0
            //jedis.close();
        }
    }
     /**
      * <p>Get the value stored in redis by key</p>
      * <p>And release the connection</p>
      * @param key
      * @return return value successfully, return null if failed
      */  
     public static String get(String key){  
         Jedis jedis = null;  
         String value = null;  
         try {  
             jedis = pool.getResource();  
             value = jedis.get(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return value;  
     }  
 
     /**
      * <p>Save key and value to redis, and release connection resources</p>
      * <p>Overwrite if the key already exists</p>
      * @param key
      * @param value
      * @return success returns OK, failure returns 0
      */  
     public static String set(String key,String value){  
         Jedis jedis = null;  
         try {  
             jedis = pool.getResource();  
             return jedis.set(key, value);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
             return "0";  
         } finally {  
             returnResource(pool, jedis);  
         }  
     }  
 
 
     /**
      * <p>Delete the specified key, you can also pass in an array containing the key</p>
      * @param keys A key can also be a string array
      * @return Return the number of successfully deleted
      */  
     public Long del(String keys){  
         Jedis jedis = null;  
         try {  
             jedis = pool.getResource();  
             return jedis.del(keys);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
             return 0L;  
         } finally {  
             returnResource(pool, jedis);  
         }  
     }  
 
     /**
      * <p>Append value to the specified value by key</p>
      * @param key
      * @param str
      * @return successfully returns the length of the added value, fails to return the length of the added value, and returns 0L on exception
      */  
     public static Long append(String key ,String str){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.append(key, str);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
             return 0L;  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Determine whether the key exists</p>
      * @param key 
      * @return true OR false 
      */  
     public Boolean exists(String key){  
         Jedis jedis = null;  
         try {  
             jedis = pool.getResource();  
             return jedis.exists(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
             return false;  
         } finally {  
             returnResource(pool, jedis);  
         }  
     }  
 
     /**
      * <p>Set the key value, if the key already exists, return 0, nx==> not exist</p>
      * @param key
      * @param value
      * @return returns 1 on success and 0 if an exception occurs
      */  
     public Long setnx(String key ,String value){  
         Jedis jedis = null;  
         try {  
             jedis = pool.getResource();  
             return jedis.setnx(key, value);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
             return 0L;  
         } finally {  
             returnResource(pool, jedis);  
         }  
     }

     /**
      * <p>Set the key value and specify the validity period of this key value</p>
      * @param key
      * @param value
      * @param seconds unit: seconds
      * @return returns OK on success, null on failure and exception
      */
     public String setex(String key,String value,int seconds){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.setex(key, seconds, value);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
 
     /**
      * <p>Replace the original value from the specified position by key and offset</p>
      * <p>The subscript starts from 0, and offset means to replace from the offset subscript</p>
      * <p>This will happen if the length of the replaced string is too small</p>
      * <p>example:</p>
      * <p>value : rscoa@richinfo.cn</p>
      * <p>str : abc</p>
      * <P>Replace from subscript 7, the result is</p>
      * <p>RES : rscoa.cn</p>
      * @param key
      * @param str
      * @param offset subscript position
      * @return returns the length of value after replacement
      */  
     public Long setrange(String key,String str,int offset){  
         Jedis jedis = null;  
         try {  
             jedis = pool.getResource();  
             return jedis.setrange(key, offset, str);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
             return 0L;  
         } finally {  
             returnResource(pool, jedis);  
         }  
     }  
 
 
 
     /**
      * <p>Get batch value by batch key</p>
      * @param keys string array can also be a key
      * @return successfully returns the set of value, fails to return the set of null, and returns empty on exception
      */  
     public static List<String> mget(String...keys){  
         Jedis jedis = null;  
         List<String> values = null;  
         try {  
             jedis = pool.getResource();  
             values = jedis.mget(keys);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return values;  
     }  
 
     /**
      * <p>Set key:value in batches, one can be used</p>
      * <p>example:</p>
      * <p> obj.mset(new String[]{"key2","value1","key2","value2"})</p>
      * @param keysvalues
      * @return returns OK on success, and returns null on failure
      * 
      */  
     public static String mset(String...keysvalues){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.mset(keysvalues);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Set key:value in batches, one can be used, if the key already exists, it will fail and the operation will be rolled back</p>
      * <p>example:</p>
      * <p>obj.msetnx(new String[]{"key2","value1","key2","value2"})</p>
      * @param keysvalues
      * @return returns 1 on success, 0 on failure
      */  
     public static Long msetnx(String...keysvalues){  
         Jedis jedis = null;  
         Long res = 0L;  
         try {  
             jedis = pool.getResource();  
             res =jedis.msetnx(keysvalues);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Set the value of key and return an old value</p>
      * @param key
      * @param value
      * @return the old value, if the key does not exist, return null
      */  
     public String getset(String key,String value){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.getSet(key, value);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Get the value at the specified subscript position through the subscript and key</p>
      * @param key
      * @param startOffset start position starts from 0, negative number means intercept from the right
      * @param endOffset
      * @return null if not returned
      */  
     public String getrange(String key, int startOffset ,int endOffset){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.getrange(key, startOffset, endOffset);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Add +1 to the value through the key. When the value is not an int type, an error will be returned. When the key does not exist, the value will be 1</p>
      * @param key
      * @return the value-added result
      */  
     public Long incr(String key){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.incr(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Add a value to the specified value through the key, if the key does not exist, then this is the value</p>
      * @param key
      * @param integer
      * @return
      */  
     public Long incrBy(String key,Long integer){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.incrBy(key, integer);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Reduce the value of the key, if the key does not exist, set the key to -1</p>
      * @param key
      * @return
      */  
     public Long decr(String key) {  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.decr(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Subtract the specified value</p>
      * @param key
      * @param integer
      * @return
      */  
     public Long decrBy(String key,Long integer){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.decrBy(key, integer);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Get the length of value by key</p>
      * @param key
      * @return null on failure
      */  
     public Long serlen(String key){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.strlen(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Set the specified value to the field through the key, if the key does not exist, create it first</p>
      * @param key
      * @param field field
      * @param value
      * @return returns 0 if there is an exception and returns null
      */  
     public Long hset(String key,String field,String value) {  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.hset(key, field, value);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Set the specified value to the field through the key, if the key does not exist, create it first, if the field already exists, return 0</p>
      * @param key
      * @param field
      * @param value
      * @return
      */  
     public Long hsetnx(String key,String field,String value){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.hsetnx(key, field, value);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Set multiple hash fields at the same time by key</p>
      * @param key
      * @param hash
      * @return return OK return null
      */  
     public String hmset(String key,Map<String, String> hash){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.hmset(key, hash);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Get the specified value by key and field</p>
      * @param key
      * @param field
      * @return does not return null
      */  
     public String hget(String key, String field){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.hget(key, field);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Get the specified value through key and fields, if there is no corresponding value, return null</p>
      * @param key
      * @param fields can be a String or a String array
      * @return 
      */  
     public List<String> hmget(String key,String...fields){  
         Jedis jedis = null;  
         List<String> res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.hmget(key, fields);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Add the given value to the value of the specified field by key</p>
      * @param key 
      * @param field 
      * @param value 
      * @return 
      */  
     public Long hincrby(String key ,String field ,Long value){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.hincrBy(key, field, value);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Judging whether there is a specified value by key and field</p>
      * @param key 
      * @param field 
      * @return 
      */  
     public Boolean hexists(String key , String field){  
         Jedis jedis = null;  
         Boolean res = false;  
         try {  
             jedis = pool.getResource();  
             res = jedis.hexists(key, field);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Return the number of fields by key</p>
      * @param key
      * @return
      */  
     public Long hlen(String key){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.hlen(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
 
     }  
 
     /**
      * <p>Delete the specified field by key</p>
      * @param key
      * @param fields can be a field or an array
      * @return
      */  
     public Long hdel(String key ,String...fields){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.hdel(key, fields);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Return all fields by key</p>
      * @param key
      * @return
      */  
     public Set<String> hkeys(String key){  
         Jedis jedis = null;  
         Set<String> res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.hkeys(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Return all values related to key by key</p>
      * @param key
      * @return
      */  
     public List<String> hvals(String key){  
         Jedis jedis = null;  
         List<String> res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.hvals(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Get all fields and values by key</p>
      * @param key
      * @return
      */  
     public Map<String, String> hgetall(String key){  
         Jedis jedis = null;  
         Map<String, String> res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.hgetAll(key);  
         } catch (Exception e) {  
              logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Add a string to the head of the list by key</p>
      * @param key
      * @param strs can be a string or an array of strings
      * @return Return the number of values in the list
      */  
     public Long lpush(String key ,String...strs){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.lpush(key, strs);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Add a string to the end of the list by key</p>
      * @param key
      * @param strs can be a string or an array of strings
      * @return Return the number of values in the list
      */  
     public Long rpush(String key ,String...strs){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.rpush(key, strs);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Add a string element before or after the position specified by the list by key</p>
      * @param key
      * @param where LIST_POSITION enumeration type
      * @param pivot list value
      * @param value added value
      * @return 
      */  
     public Long linsert(String key, LIST_POSITION where,  
                         String pivot, String value){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.linsert(key, where, pivot, value);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Set the list to specify the value of the subscript position through the key</p>
      * <p>If the subscript exceeds the number of values in the list, an error will be reported</p>
      * @param key
      * @param index starts from 0
      * @param value
      * @return successfully returns OK
      */  
     public String lset(String key ,Long index, String value){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.lset(key, index, value);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Delete the specified count elements with the same value from the corresponding list by key</p>
      * @param key
      * @param count delete all when count is 0
      * @param value
      * @return returns the number of deleted
      */  
     public Long lrem(String key,long count,String value){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.lrem(key, count, value);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Reserve the value from the strat subscript to the end subscript in the list by key</p>
      * @param key
      * @param start
      * @param end
      * @return successfully returns OK
      */  
     public String ltrim(String key ,long start ,long end){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.ltrim(key, start, end);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Delete a value from the head of the list by key, and return the value</p>
      * @param key 
      * @return 
      */  
     synchronized public String lpop(String key){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.lpop(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Delete a value from the end of the list by key, and return the element</p>
      * @param key 
      * @return 
      */  
     synchronized public String rpop(String key){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.rpop(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Delete a value from the end of a list by key and add it to the head of another list, and return the value</p>
      * <p>If the first list is empty or does not exist, return null</p>
      * @param srckey 
      * @param dstkey 
      * @return 
      */  
     public String rpoplpush(String srckey, String dstkey){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.rpoplpush(srckey, dstkey);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Get the value of the specified subscript position in the list by key</p>
      * @param key
      * @param index
      * @return null if not returned
      */  
     public String lindex(String key,long index){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.lindex(key, index);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Return the length of the list by key</p>
      * @param key 
      * @return 
      */  
     public Long llen(String key){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.llen(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Get the value of the specified subscript position of the list through the key</p>
      * <p>If start is 0 and end is -1, all values in the list will be returned</p>
      * @param key 
      * @param start 
      * @param end 
      * @return 
      */  
     public List<String> lrange(String key,long start,long end){  
         Jedis jedis = null;  
         List<String> res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.lrange(key, start, end);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Add value to the specified set by key</p>
      * @param key
      * @param members can be a String or a String array
      * @return The number of successful additions
      */  
     public Long sadd(String key,String...members){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.sadd(key, members);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Delete the corresponding value in the set by key</p>
      * @param key
      * @param members can be a String or a String array
      * @return the number of deletions
      */  
     public Long srem(String key,String...members){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.srem(key, members);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Randomly delete a value in a set by key and return the value</p>
      * @param key 
      * @return 
      */  
     public String spop(String key){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.spop(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Get the difference in set by key</p>
      * <p>Take the first set as the standard</p>
      * @param keys can be a string and return all the values in the set, or it can be a string array
      * @return 
      */  
     public Set<String> sdiff(String...keys){  
         Jedis jedis = null;  
         Set<String> res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.sdiff(keys);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Get the difference in the set through the key and store it in another key</p>
      * <p>Take the first set as the standard</p>
      * @param dstkey The key stored in the difference set
      * @param keys can be a string and return all the values in the set, or it can be a string array
      * @return 
      */  
     public Long sdiffstore(String dstkey,String... keys){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.sdiffstore(dstkey, keys);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Get the intersection in the specified set by key</p>
      * @param keys can be a string or an array of strings
      * @return 
      */  
     public Set<String> sinter(String...keys){  
         Jedis jedis = null;  
         Set<String> res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.sinter(keys);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Get the intersection in the specified set by key and store the result in a new set</p>
      * @param dstkey
      * @param keys can be a string or an array of strings
      * @return 
      */  
     public Long sinterstore(String dstkey,String...keys){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.sinterstore(dstkey, keys);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Return the union of all sets by key</p>
      * @param keys can be a string or an array of strings
      * @return
      */  
     public Set<String> sunion(String... keys){  
         Jedis jedis = null;  
         Set<String> res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.sunion(keys);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Return the union of all sets by key and store them in the new set</p>
      * @param dstkey
      * @param keys can be a string or an array of strings
      * @return 
      */  
     public Long sunionstore(String dstkey,String...keys){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.sunionstore(dstkey, keys);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Remove the value in the set by key and add it to the second set</p>
      * @param srckey needs to be removed
      * @param dstkey added
      * @param value in member set
      * @return 
      */  
     public Long smove(String srckey, String dstkey, String member){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.smove(srckey, dstkey, member);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Get the number of values in the set by key</p>
      * @param key 
      * @return 
      */  
     public Long scard(String key){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.scard(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Determine whether the value is an element in the set by key</p>
      * @param key 
      * @param member 
      * @return 
      */  
     public Boolean sismember(String key,String member){  
         Jedis jedis = null;  
         Boolean res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.sismember(key, member);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Get the random value in the set through the key, do not delete the element</p>
      * @param key 
      * @return 
      */  
     public String srandmember(String key){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.srandmember(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Get all the values in the set by key</p>
      * @param key 
      * @return 
      */  
     public Set<String> smembers(String key){  
         Jedis jedis = null;  
         Set<String> res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.smembers(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
 
     /**
      * <p>Add value and score to zset by key, where score is used for sorting</p>
      * <p>If the value already exists, update the element according to the score</p>
      * @param key 
      * @param score 
      * @param member 
      * @return 
      */  
     public Long zadd(String key,double score,String member){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.zadd(key, score, member);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Delete the value specified in zset by key</p>
      * @param key
      * @param members can be a string or a string array
      * @return 
      */  
     public Long zrem(String key,String...members){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.zrem(key, members);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Increase the score value of the value in the zset through the key</p>
      * @param key 
      * @param score 
      * @param member 
      * @return 
      */  
     public Double zincrby(String key ,double score ,String member){  
         Jedis jedis = null;  
         Double res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.zincrby(key, score, member);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Return the ranking of value in zset by key</p>
      * <p>Sort subscripts from small to large</p>
      * @param key 
      * @param member 
      * @return 
      */  
     public Long zrank(String key,String member){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.zrank(key, member);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>Return the ranking of value in zset by key</p>
      * <p>Sort subscripts from largest to smallest</p>
      * @param key 
      * @param member 
      * @return 
      */  
     public Long zrevrank(String key,String member){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.zrevrank(key, member);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /**
      * <p>The value of zset in score from start to end will be obtained by key</p>
      * <p>socre sorted from big to small</p>
      * <p>Return all when start is 0 and end is -1</p>
      * @param key 
      * @param start 
      * @param end 
      * @return 
      */  
     public Set<String> zrevrange(String key ,long start ,long end){  
         Jedis jedis = null;  
         Set<String> res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.zrevrange(key, start, end);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /** 
      * <p>Return the value in zset in the specified score by key</p>
      * @param key 
      * @param max 
      * @param min 
      * @return 
      */  
     public Set<String> zrangebyscore(String key,String max,String min){  
         Jedis jedis = null;  
         Set<String> res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.zrevrangeByScore(key, max, min);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /** 
      * <p>Return the value in zset in the specified score by key</p>
      * @param key 
      * @param max 
      * @param min 
      * @return 
      */  
     public Set<String> zrangeByScore(String key ,double max,double min){  
         Jedis jedis = null;  
         Set<String> res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.zrevrangeByScore(key,max,min);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /** 
      * <p>Returns the number of values in zset within the specified interval</p>
      * @param key 
      * @param min 
      * @param max 
      * @return 
      */  
     public Long zcount(String key,String min,String max){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.zcount(key, min, max);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /** 
      * <p>Return the number of values in zset by key</p>
      * @param key 
      * @return 
      */  
     public Long zcard(String key){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.zcard(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /** 
      * <p>Get the score value of value in zset by key</p>
      * @param key 
      * @param member 
      * @return 
      */  
     public Double zscore(String key,String member){  
         Jedis jedis = null;  
         Double res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.zscore(key, member);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /** 
      * <p>Delete elements in a given interval by key</p>
      * @param key 
      * @param start 
      * @param end 
      * @return 
      */  
     public Long zremrangeByRank(String key ,long start, long end){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.zremrangeByRank(key, start, end);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /** 
      * <p>Delete elements in the specified score by key</p>
      * @param key 
      * @param start 
      * @param end 
      * @return 
      */  
     public Long zremrangeByScore(String key,double start,double end){  
         Jedis jedis = null;  
         Long res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.zremrangeByScore(key, start, end);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
     /**
      * <p>Return all keys that satisfy the pattern expression</p>
      * <p>keys(*)</p>
      * <p>Return all keys</p>
      * @param pattern
      * @return
      */
     public Set<String> keys(String pattern){  
         Jedis jedis = null;  
         Set<String> res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.keys(pattern);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /** 
      * <p>Judging value type by key</p>
      * @param key 
      * @return 
      */  
     public String type(String key){  
         Jedis jedis = null;  
         String res = null;  
         try {  
             jedis = pool.getResource();  
             res = jedis.type(key);  
         } catch (Exception e) {  
 
             logger.error(e.getMessage());  
         } finally {  
             returnResource(pool, jedis);  
         }  
         return res;  
     }  
 
     /** 
      * return to the connection pool
      * 
      * @param pool 
      * @param jedis 
      */  
     public static void returnResource(JedisPool pool, Jedis jedis) {  
         if (jedis != null) {
             pool.returnResource(jedis);  
         }  
     }  
 
     /**
      * Get RedisUtil instance
      * @return
      */
     public static RedisUtil getRu() {  
         return ru;  
     }  
 
     /**
      * new A RedisUtil object
      * @param ru
      */
     public static void setRu(RedisUtil ru) {  
         RedisUtil.ru = ru;  
     } 
 
     /**
      * redis test
      * @param args
      */
     public static void main(String[] args) {
         RedisUtil.getRu().set("rcs_oa", "rcs_oa_value");
         System.out.println(RedisUtil.getRu().get("rcs_oa"));
         System.out.println(RedisUtil.getRu().getrange("rcs_oa", 0, 1));
         System.out.println(RedisUtil.getRu().getset("rcs_oa", "rcs_oa_new"));
         //System.out.println(RedisUtil.hget("rcs_oa","rcs"));
         System.out.println(RedisUtil.getRu().get("rcs_oa"));
         //System.out.println(RedisUtil.lindex("rcs_oa", 1));
         //System.out.println(RedisUtil.del("rcs_oa"));
         System.out.println(RedisUtil.getRu().get("rcs_oa"));
         System.out.println(RedisUtil.getRu().exists("rcs_oa"));
         System.out.println(RedisUtil.getRu().type("rcs_oa"));
     }
 }  