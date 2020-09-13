package com.hbu.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringHelper {

	/**
	 * 判断一个字符串是空字串或者为 null
	 * 
	 * @param sz
	 * @return 如果一个字串是 null 或 ""，返回 true
	 */
	public static final boolean isEmptyString(String sz) {
		if (sz == null) {
			return true;
		}
		sz = sz.trim();
		if (sz.length() == 0) {
			return true;
		}
		return false;
	}
	
	

	/**
	 * 判断字符是否为空
	 * 
	 * @param value
	 * @return
	 */
	public static Boolean IsEmpty(String value) {
		return value == null || value.length() == 0;
	}
	
	/**
	 * 判断字符串是否为字母、数字、下划线
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNumOrAlpha(String str) {
		if (str == null || "".equals(str)) {
			return true;
		}
		String regex = "^\\w+$";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(str);
		return m.matches();
	}

	/**
	 * 判断是否为数字（正整数）
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNum(String str) {
		if (str == null || "".equals(str)) {
			return true;
		}
		String regex = "^\\d+$";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(str);
		return m.matches();
	}

	public static boolean isNumeric(String str) {
		Pattern pattern = Pattern.compile("[0-9]*");
		return pattern.matcher(str).matches();
	}
	
	/**
	 * 判断一个字符串是否是数字型
	 * 
	 * @param num
	 *            字符串
	 * */
	public static boolean isDigit(String num) {
		// ^[0-9]+(\.[0-9]{2})?$
		Pattern p1 = Pattern.compile("^[0]{1,}(\\.){1}\\d{1,}$");
		Pattern p = Pattern.compile("^[1-9]{1,}(\\.){0,1}\\d{0,}$");
		return p1.matcher(num).find() || p.matcher(num).find();
	}

	/**
	 * join
	 * 
	 * @param list
	 * @param flag
	 * @return
	 */
	public static String join(List<?> list, String flag) {
		StringBuffer str_buff = new StringBuffer();
		for (int i = 0, len = list.size(); i < len; i++) {
			str_buff.append(String.valueOf(list.get(i)));
			if (i < len - 1) {
				str_buff.append(flag);
			}
		}
		return str_buff.toString();
	}

	public static String join(String[] arr, String flag) {
		StringBuffer str_buff = new StringBuffer();
		for (int i = 0, len = arr.length; i < len; i++) {
			str_buff.append(arr[i]);
			if (i < len - 1) {
				str_buff.append(flag);
			}
		}
		return str_buff.toString();
	}

	public static boolean isNotEmpty(String str) {
		return !isEmpty(str);
	}

	public static boolean isTradeNotEmpty(String str) {
		return !(str == null || str.trim().length() == 0 || "0".equals(str));
	}

	public static boolean isEmpty(String str) {
		return str == null || str.trim().length() == 0;
	}

	public static String composeMessage(String source, String... replacement) {
		if (replacement.length == 0) {
			return source;
		}
		for (String element : replacement) {
			int start = source.indexOf("${");
			if (start < 0) {
				return source;
			}
			int end = source.indexOf("}") + 1;
			String pattern = source.substring(start, end);
			if (element == null) {
				source = source.replace(pattern, "");
			} else {
				source = source.replace(pattern, element);
			}
		}
		return source;
	}

	/**
	 * 隐藏字符
	 * 
	 * @param str
	 *            原始字符串
	 * @param startPos
	 *            隐藏开始位
	 * @param endPos
	 *            隐藏结束位
	 * @return
	 */
	public static String hideStr(String str, int startPos, int endPos) {
		if (isEmpty(str)) {
			return str;
		}
		if (startPos < 0) {
			startPos = 0;
		}
		if (endPos < 0 || endPos > str.length()) {
			endPos = str.length();
		}
		if (startPos > endPos) {
			startPos = endPos;
		}
		return str.substring(0, startPos) + "***" + str.substring(endPos, str.length());
	}

	/**
	 * 判断某个字符串是否存在于数组中
	 * 
	 * @param stringArray
	 *            原数组
	 * @param source
	 *            查找的字符串
	 * @return
	 */
	public static boolean contails(String[] stringArray, String source) {
		// 转换为list
		List<String> tempList = Arrays.asList(stringArray);

		// 利用list的包含方法,进行判断
		if (tempList.contains(source)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 将string[] 转为long[]
	 * 
	 * @param source
	 * @return
	 */
	public static Long[] converToLong(String[] source) {
		Long[] value = new Long[source.length];
		for (int i = 0; i < source.length; i++) {
			value[i] = Long.parseLong(source[i]);
		}
		return value;
	}
	
	
	
	
	/**
	 * 字符串转浮点型
	 * 
	 * @param s
	 * @param defaultvalue
	 *            (默认值)
	 * @return
	 */
	public static double tryParseDouble(String s, double defaultvalue) {
		if (IsEmpty(s))
			return defaultvalue;
		try {
			return Double.parseDouble(s);
		} catch (Exception ex) {
			return defaultvalue;
		}
	}
	
	
	
	/**
	 * 字符串转整形
	 * 
	 * @param s
	 * @param value
	 * @return
	 */
	public static int tryParseInt(String s, Integer value) {
		if (IsEmpty(s))
			return value;
		try {
			return Integer.parseInt(s);
		} catch (Exception ex) {
			return value;
		}
	}
	
	
	/**
	 * 字符串转整形
	 * 
	 * @param s
	 * @param value
	 * @return
	 */
	public static long tryParseLong(String s, long value) {
		if (IsEmpty(s))
			return value;
		try {
			return Long.parseLong(s);
		} catch (Exception ex) {
			return value;
		}
	}

	/**
	 * 字符串转浮点型
	 * 
	 * @param s
	 * @param defaultvalue
	 *            (默认值)
	 * @return
	 */
	public static float tryParseFloat(String s, float defaultvalue) {
		if (IsEmpty(s))
			return defaultvalue;
		try {
			return Float.parseFloat(s);
		} catch (Exception ex) {
			return defaultvalue;
		}
	}
	
	public static String urlDecode(String content, String charset) {
		try {
			if(content!=null){
				return URLDecoder.decode(content, charset);
			}else {
				return "";
			}
		} catch (UnsupportedEncodingException ex) {
			return content;
		}
	}
	public static String urlEncode(String content, String charset) {
		try {
			return URLEncoder.encode(content, charset);
		} catch (UnsupportedEncodingException ex) {
			return content;
		}
	}
	
	public static String join(Integer[] arr, String flag) {
		StringBuffer str_buff = new StringBuffer();
		for (int i = 0, len = arr.length; i < len; i++) {
			str_buff.append(arr[i]);
			if (i < len - 1) {
				str_buff.append(flag);
			}
		}
		return str_buff.toString();
	}
	
}
