package DiamonShop.Service.User;

import org.springframework.stereotype.Service;

import DiamonShop.Dto.PaginatesDto;

@Service
public class PaginatesServiceImpl implements IPaginatesService {

	public PaginatesDto getInfoPaginates(int totalData, int limitPage, int currentPage) {
		PaginatesDto paginate = new PaginatesDto();
		
		paginate.setLimitPage(limitPage);
		
		paginate.setTotalPage(setInfoTotalPage(totalData, limitPage));	
		
		paginate.setCurrentPage(checkCurrentPage(currentPage, paginate.getTotalPage()));
		
		int start = findStart(paginate.getCurrentPage(), limitPage);
		paginate.setStartPage(start);
		
		int end = findEnd(paginate.getStartPage(), limitPage, totalData);
		paginate.setEndPage(end);
		
		return paginate;
	}

	public int findEnd(int start, int limitPage, int totalData) {
		return start + limitPage > totalData ? totalData : start + limitPage - 1;
	}

	public int findStart(int currentPage, int limitPage) {
		return (currentPage - 1) * limitPage + 1;
	}

	public int setInfoTotalPage(int totalData, int limitPage) {
		int totalPage = 0;
		totalPage = totalData / limitPage;
		totalPage = totalPage * limitPage < totalData ? totalPage + 1 : totalPage;
		return totalPage;
	}
	
	public int checkCurrentPage(int currentPage, int totalPage) {
		if(currentPage < 1) return 1;
		if(currentPage > totalPage) return totalPage;
		return currentPage;
	}

}
