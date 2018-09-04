package yogi.members;

import java.math.BigInteger;
import java.security.SecureRandom;

public class Naver {

	// CSRF 방지를 위한 상태 토큰 생성 코드
	// 상태 토큰은 추후 검증을 위해 세션에 저장되어야 한다.
	public String generateState()
	{
	    SecureRandom random = new SecureRandom();
	    return new BigInteger(130, random).toString(32);
	}

//	// 상태 토큰으로 사용할 랜덤 문자열 생성
//	String state = generateState();
//	// 세션 또는 별도의 저장 공간에 상태 토큰을 저장
//	request.session().attribute("state", state);
//	return state;
	
//	https://nid.naver.com/oauth2.0/authorize?client_id={클라이언트 아이디}&response_type=code&redirect_uri={개발자 센터에 등록한 콜백 URL(URL 인코딩)}&state={상태 토큰}
		
//		
//		// CSRF 방지를 위한 상태 토큰 검증 검증
//		// 세션 또는 별도의 저장 공간에 저장된 상태 토큰과 콜백으로 전달받은 state 파라미터의 값이 일치해야 함
//		// 콜백 응답에서 state 파라미터의 값을 가져옴
//		String state = request.queryParams(“state”);
//
//		// 세션 또는 별도의 저장 공간에서 상태 토큰을 가져옴
//		String storedState = request.session().attribute(“state”);
//
//		if( !state.euals( storedState ) ) {
//		    return RESPONSE_UNAUTHORIZED; //401 unauthorized
//		} else {
//		    Return RESPONSE_SUCCESS; //200 success
//		}
		
//		https://nid.naver.com/oauth2.0/token?client_id={클라이언트 아이디}&client_secret={클라이언트 시크릿}&grant_type=authorization_code&state={상태 토큰}&code={인증 코드}
}
