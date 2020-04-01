package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import vo.BankVO;
import vo.GuestVO;
import vo.OrderListVO;
import vo.OrderVO;
import vo.PayBankVO;
import vo.PayMoneyVO;
import vo.VirtualAccountVO;

public class OrderDAOImpl implements OrderDAO{

	private SqlSessionTemplate sqlSessionTemplate;

	public OrderDAOImpl(SqlSessionTemplate sqlSessionTemplate) {
		super();
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public int insertOrder(OrderVO orderVO) {
		return sqlSessionTemplate.insert("orderDAO.insertOrder", orderVO);
	}

	@Override //가상계좌 인설트
	public int insertByvirtualAccount(VirtualAccountVO virtualAccountVO) {
		return sqlSessionTemplate.insert("orderDAO.insertVirtualAccount",virtualAccountVO);
	}

	@Override //주문 셀렉트
	public OrderVO selectOrderByorderNum(int orderNum) {
		return sqlSessionTemplate.selectOne("orderDAO.selectOrder", orderNum);
	}
	@Override //은행 셀렉트
	public int selectBankCode(int bankCode) {
		return sqlSessionTemplate.selectOne("orderDAO.selectBankCode", bankCode);
	}

	@Override //가상계좌 셀렉트
	public PayBankVO selectByVirtualAccount(int orderNum) {
		return sqlSessionTemplate.selectOne("orderDAO.selectByVirtualAccount",orderNum);
	}

	@Override //무통장 인설트
	public int insertByPayBank(PayBankVO payBankVO) {
		return sqlSessionTemplate.insert("orderDAO.insertPayBank", payBankVO);
	}

	@Override //무통장 셀렉트
	public PayBankVO selectPayBank(int orderNum) {
		return sqlSessionTemplate.selectOne("orderDAO.selectPayBank", orderNum);
	}

	@Override //응답코드
	public int updateRespCode(PayMoneyVO payMoney) {
		return sqlSessionTemplate.update("orderDAO.updateRespCode", payMoney);
	}

	@Override //결제완료일 
	public void updatePaydateByPaybank(int result) {
		sqlSessionTemplate.update("orderDAO.updatepayDate",result);
	}
	
	@Override //주문상태변경
	public void updateStateByOrder(int success) {
		sqlSessionTemplate.update("orderDAO.updateState", success);
	}

	@Override
	public List<BankVO> selectByBankVO() {
		return sqlSessionTemplate.selectList("orderDAO.selectByBankVO");
	}

	@Override
	public int insertPayCard(OrderVO orderVO) {
		return sqlSessionTemplate.insert("orderDAO.insertPayCard", orderVO);
	}
	
	@Override
	public OrderVO selectLatelyOrderNum(String id) {
		return sqlSessionTemplate.selectOne("orderDAO.selectLatelyOrderNum", id);
	}
	
	@Override
	public OrderVO selectTonameOrderNum(String toName) {
		return sqlSessionTemplate.selectOne("orderDAO.selectTonameOrderNum", toName);
	}
	
	@Override
	public int insertOrderList(OrderListVO orderListVO) {
		return sqlSessionTemplate.insert("orderDAO.insertOrderList", orderListVO);
	}
	
	@Override
	public int decrementStockProduct(OrderListVO orderListVO) {
		return sqlSessionTemplate.update("orderDAO.decrementStockProduct", orderListVO);
	}
	
	@Override
	public int decrementStockOption(OrderListVO orderListVO) {
		return sqlSessionTemplate.update("orderDAO.decrementStockOption", orderListVO);
	}
	
	@Override
	public int selectProductNumByOptionNum(int optionNum) {
		return sqlSessionTemplate.selectOne("orderDAO.selectProductNumByOptionNum", optionNum);
	}

	@Override
	public void insertGuest(GuestVO guestvo) {
				sqlSessionTemplate.insert("orderDAO.insertGuest", guestvo);
		
	}

	@Override
	public List<GuestVO> selectOrderByGuest(GuestVO guestVO) {
		return sqlSessionTemplate.selectList("orderDAO.selectOrderByGuest",guestVO);
	}

	@Override
	public List<OrderListVO> selectOrderListByorderNum(int[] orderNum) {
		return sqlSessionTemplate.selectList("orderDAO.selectOrderListByorderNum",orderNum);
	}

	@Override
	public List<VirtualAccountVO> selectVirtualAccountVO(int[] orderNum) {
		return sqlSessionTemplate.selectList("orderDAO.selectVirtualAccountVO",orderNum);
	}

	@Override
	public List<OrderVO> selectOrderByorderNums(int[] orderNum) {
		return sqlSessionTemplate.selectList("orderDAO.selectOrderByorderNums",orderNum);
	}

	@Override
	public List<Integer> selectPayBankByOrderNum(int[] orderNums) {
		return sqlSessionTemplate.selectList("orderDAO.selectPayBankByOrderNum",orderNums);
	}

	@Override
	public List<Integer> selectPayCardByOrderNum(int[] orderNums) {
		return sqlSessionTemplate.selectList("orderDAO.selectPayCardByOrderNum",orderNums);
	}

	@Override
	public BankVO selectBankName(int bankCode) {
		return sqlSessionTemplate.selectOne("orderDAO.selectBankName",bankCode);
	}




}
