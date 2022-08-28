package member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.bean.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 글쓰기
	public int write(MemberDTO dto) {
		return sqlSession.insert("mybatis.memberMapper.write", dto);
	}
	
	// 로그인
	public String login(String id, String pwd) {
		Map<String,String> map= new HashMap<String, String>(); 
		map.put("id", id);
		map.put("pwd", pwd);
		return sqlSession.selectOne("mybatis.memberMapper.login", map);
	}
	
	// id 검사  (★주의)
	// member-mapping에서는 resultType을 boolean값으로 쓸수 없기때문에
	// String 또는 dto로 받아서 null인지를 확인해줌 
	public boolean isExistId(String id) {
		boolean exist = false;
		if(sqlSession.selectOne("mybatis.memberMapper.isExistId", id) != null) {
			exist = true;
		}
		return exist;
	}
		
	// 회원정보 수정하기
	public int modify(MemberDTO dto) {
		return sqlSession.update("mybatis.memberMapper.modify", dto);
	}
		
	// 회원1명의 정보 읽어오기
	public MemberDTO getMember(String id) {
		return sqlSession.selectOne("mybatis.memberMapper.getMember", id);
	}
		
	// 회원탈퇴 (삭제)
	public int delete(String id) {
		return sqlSession.delete("mybatis.memberMapper.delete",id);
	}
		
	// 목록
	public List<MemberDTO> selectList(int startNum, int endNum) {
		Map<String, Integer> map= new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return sqlSession.selectList("mybatis.memberMapper.selectList",map);
	}
		
	// 총 인원수 
	public int getTotalMember() {
		return sqlSession.selectOne("mybatis.memberMapper.getTotalMember");
	}	
}
