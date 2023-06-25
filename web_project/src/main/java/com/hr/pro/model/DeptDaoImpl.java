package com.hr.pro.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.hr.pro.dto.Dept_DTO;
import com.hr.pro.manager.SqlSessionFactoryManager;

public class DeptDaoImpl implements IDeptDao {
	
	private Logger logger = Logger.getLogger(DeptDaoImpl.class);
	private final String NS = "com.hr.pro.model.DeptDaoImpl.";
	private SqlSessionFactory manager = SqlSessionFactoryManager.getFactory();

	@Override
	public List<Dept_DTO> dept_selectAll() {
		SqlSession session = manager.openSession();
		List<Dept_DTO> resultDto = session.selectList(NS+"dept_selectAll");
		return resultDto;
	}

	@Override
	public List<Dept_DTO> dept_id_drop() {
		SqlSession session = manager.openSession();
		List<Dept_DTO> resultDto = session.selectList(NS+"dept_id_drop");
		return resultDto;
	}

	@Override
	public List<Dept_DTO> dept_search_name(Dept_DTO dto) {
		SqlSession session = manager.openSession();
		List<Dept_DTO> resultDto = session.selectList(NS+"dept_search_name", dto);
		return resultDto;
	}

	@Override
	public boolean dept_update_name(Map<String, Object> map) {
		SqlSession session = manager.openSession(true);
		int n = session.update(NS+"dept_update_name", map);
		return (n>0)? true:false;
	}

	@Override
	public List<Dept_DTO> dept_managerId_drop() {
		SqlSession session = manager.openSession();
		List<Dept_DTO> resultDto = session.selectList(NS+"dept_managerId_drop");
		return resultDto;
	}

	@Override
	public boolean dept_update_managerId(Map<String, Object> map) {
		SqlSession session = manager.openSession(true);
		int n = session.update(NS+"dept_update_managerId", map);
		return (n>0)? true:false;
	}

	@Override
	public int dept_update_empManagerId(Map<String, Object> map) {
		SqlSession session = manager.openSession(true);
		int n = session.update(NS+"dept_update_empManagerId", map);
		return n;
	}

	@Override
	public boolean dept_delete(Dept_DTO dto) {
		SqlSession session = manager.openSession(true);
		int n = session.delete(NS+"dept_delete", dto);
		return (n>0)?true:false;
	}

	@Override
	public int dept_delete_empDeptId(Dept_DTO dto) {
		SqlSession session = manager.openSession(true);
		int n = session.update(NS+"dept_delete_empDeptId", dto);
		return n;
	}

	@Override
	public int dept_insert_idName(Map<String, Object> map) {
		SqlSession session = manager.openSession(true);
		int n = session.insert(NS+"dept_insert_idName", map);
		return n;
	}

	@Override
	public List<Dept_DTO> dept_empManagerId_drop() {
		SqlSession session = manager.openSession();
		List<Dept_DTO> resultDto = session.selectList(NS+"dept_empManagerId_drop");
		return resultDto;
	}

	@Override
	public boolean dept_insert_managerId(Map<String, Object> map) {
		SqlSession session = manager.openSession(true);
		int n = session.update(NS+"dept_insert_managerId", map);
		return (n>0)?true:false;
	}

	@Override
	public int dept_insert_empManagerId(Map<String, Object> map) {
		SqlSession session = manager.openSession(true);
		int n = session.update(NS+"dept_insert_empManagerId", map);
		return n;
	}

}
