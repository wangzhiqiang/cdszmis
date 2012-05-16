package org.cdszmis.action;

import java.awt.Font;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.annotation.Resource;
import org.apache.commons.collections.map.HashedMap;
import org.cdszmis.dao.PublicDao;
import org.cdszmis.entity.DepartmentEntity;
import org.cdszmis.entity.ProjectArrangementEntity;
import org.cdszmis.entity.ProjectDepartArrangementEntity;
import org.cdszmis.entity.ProjectEntity;
import org.cdszmis.entity.ProjectStatusEntity;
import org.cdszmis.service.ProjectService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.hibernate.mapping.Array;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.DefaultCategoryDataset;
@SuppressWarnings ("serial")
public class ProjectAction extends ActionSupport {
	@Resource private ProjectService projectservice;
	@Resource private PublicDao publicDao;
	private ProjectEntity project;    
	private ProjectStatusEntity projectstatus;
	ProjectArrangementEntity paentity;
	ProjectDepartArrangementEntity pdaentity;
	private String chargeperson;
	private String departids;
	private String isdel = null;
	private JFreeChart chart;

	public String projectmanage() {
		if(project != null)
		{
			if(isdel == null)
			{
				projectservice.projectManage(project);
				projectstatus.setProjectEntity(project);
				projectstatus.setStatus(0);
				publicDao.saveOrupdateObject(projectstatus);

			} else
			{
				System.out.print("**************" + project.getId());
				projectservice.delProject(project);
				
				

			}
		}
		List <ProjectEntity> plist = projectservice.projectList();
		ActionContext.getContext().put("allproject",plist);
		return "add";
	}

	public String findallProject() {
		List <ProjectEntity> plist = projectservice.projectList();
		ActionContext.getContext().put("allproject",plist);
		return "listproject";
	}

	public String arrangeDepartids() {
		if(null != paentity && paentity.getDepartids().equals(""))
		{
			ProjectEntity pro=new ProjectEntity();
			//查出项目信息
//			pro=(ProjectEntity) publicDao.queryObject(ProjectEntity.class,传的ID);
			
			
			//将项目信息保存到 所级安排
			paentity.setProjectEntity(pro);
			//保存所级安排信息
			projectservice.arrangeDepart(paentity,departids);
		}
		//List <ProjectArrangementEntity> plist = projectservice.noarrangedDepart();
		//ActionContext.getContext().put("allnoarrangdepart",plist);
		
		List <ProjectEntity> lsp=publicDao.findObjectListByHsql("select DISTINCT obj from ProjectEntity obj ,ProjectArrangementEntity obj1  where obj.id not in obj1.projectEntity.id ");
		
//		publicDao.queryList(ProjectEntity.class);
		ActionContext.getContext().put("lsp",lsp);
		return "arrangedepart";

	}

	public String arrangePerson() {
		if(null != pdaentity && pdaentity.equals(""))
		{
			projectservice.arrangeChargePerson(pdaentity,chargeperson);
		}
		List <ProjectDepartArrangementEntity> plist = projectservice
				.noarrangedPerson();
		ActionContext.getContext().put("allnoarrangperson",plist);
		return "arrangeperson";
	}

	public String projectImpl() {
		try
		{
			projectservice.changeStatus(projectstatus);
		} catch(Exception e)
		{

			e.printStackTrace();
		}
		List <ProjectStatusEntity> plist = projectservice.statusList();
		ActionContext.getContext().put("allproject",plist);
		return "projectimpl";
	}

	public String projectCheck() {
		try
		{
			projectservice.changeStatus(projectstatus);
		} catch(Exception e)
		{

			e.printStackTrace();
		}
		List <ProjectStatusEntity> plist = projectservice.statusList();
		ActionContext.getContext().put("allproject",plist);
		return "projectcheck";
	}

	public String projectSign() {
		try
		{
			projectservice.changeStatus(projectstatus);
		} catch(Exception e)
		{

			e.printStackTrace();
		}
		List <ProjectStatusEntity> plist = projectservice.statusList();
		ActionContext.getContext().put("allproject",plist);
		return "projectsign";
	}

	public String projectPublic() {
		try
		{
			projectservice.changeStatus(projectstatus);
		} catch(Exception e)
		{

			e.printStackTrace();
		}
		List <ProjectStatusEntity> plist = projectservice.statusList();
		ActionContext.getContext().put("allproject",plist);
		return "projectpublic";
	}

	public String projectSale() {
		try
		{
			projectservice.changeStatus(projectstatus);
		} catch(Exception e)
		{

			e.printStackTrace();
		}
		List <ProjectStatusEntity> plist = projectservice.statusList();
		ActionContext.getContext().put("allproject",plist);
		return "projectsale";
	}

	public String projectFilling() {
		try
		{
			projectservice.changeStatus(projectstatus);
		} catch(Exception e)
		{

			e.printStackTrace();
		}
		List <ProjectStatusEntity> plist = projectservice.statusList();
		ActionContext.getContext().put("allproject",plist);
		return "projectfilling";
	}

	/**
	 * 按部门统计
	 * 
	 * @return
	 */
	public String conutBydepart() {
//		String HSQL="from ProjectArrangementEntity obj where obj.departids like '%"+1+"%'";
//		List lsp=publicDao.findObjectListByHsql(HSQL);
//		ActionContext.getContext().put("lsp",lsp);
		return "countbydepart";
	}
	public  String barPic(){
		String HSQL="from ProjectArrangementEntity ";//obj where obj.departids like '%"+1+"%'";
		//项目安排信息
		List lsp=publicDao.findObjectListByHsql(HSQL);
		
		Map<Integer,String> map=new HashedMap();
		
		ProjectArrangementEntity pae=null ;
		DepartmentEntity depart=null;
		
		List <DepartmentEntity> lsd=new ArrayList <DepartmentEntity>();
		for(int i=0;i<lsp.size();i++){
			 pae=new ProjectArrangementEntity();
			 pae=(ProjectArrangementEntity) lsp.get(i);
			 depart=new DepartmentEntity();
			 if(null!=pae.getDepartids()&&!"".equals(pae.getDepartids()))
			 depart=(DepartmentEntity) publicDao.queryObject(DepartmentEntity.class,Integer.valueOf(pae.getDepartids()));
			 lsd.add(depart);
//				try
//				{
//					map.put(i,depart.getDepartname());
//				} catch(Exception e)
//				{
//					e.printStackTrace();
//				}
		}
		Map<Integer,String[]> cmap=new HashedMap();
		String str[] = new String[3];
//		str[0]="id";
//		str[1]="name";
//		str[2]="count";
		 
		
		// cmap.get(1)[1] ;
		 DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		 for(int j=0;j<lsd.size();j++){
			 if(cmap.size()>0){
				 String s[]=new String[3];
				 s=cmap.get(lsd.get(j).getId());
	//			 System.out.println(s[0]+"--"+s[1]+"--"+s[2]);
				 if(null==s){
					 s =new String[3];
					 s[0]=String.valueOf(lsd.get(j).getId());
					 s[1]=lsd.get(j).getDepartname();
					 s[2]="1";
					 cmap.put(lsd.get(j).getId(),s);
				 }else{
					 s[2]=String.valueOf((Integer.valueOf(s[2])+1));
					 cmap.put(lsd.get(j).getId(),s);
				 }
			 }else{
				 str[0]=String.valueOf(lsd.get(j).getId());
				 str[1]=lsd.get(j).getDepartname();
				 str[2]="1";
				 cmap.put(lsd.get(j).getId(),str);
			 }
			 
//			 dataset.addValue(o, "", temp);
		 }
		 
		 Set<Integer> st=cmap.keySet();
		 
		 Iterator <Integer> it=st.iterator();
		 while(it.hasNext()){
			
			 Integer in= it.next() ;
//			 System.out.println(cmap.get(in)[1]);
//			 System.out.println("in"+in+"sn"+sn);
			 dataset.addValue(Integer.valueOf(cmap.get(in)[2]),"",cmap.get(in)[1]);
		 }
		 
		// dataset.addValue(l, "部门1", map.get(j));
		chart = ChartFactory.createBarChart3D(
				"部门项目分配情况", // 图表标题
				"部门", // 目录轴的显示标签
				"项目数", // 数值轴的显示标签
				dataset, // 数据集
				PlotOrientation.VERTICAL, // 图表方向：水平、垂直
				false, 	// 是否显示图例(对于简单的柱状图必须是false)
				true, 	// 是否生成工具
				true 	// 是否生成URL链接
				);
		   CategoryPlot plot = chart.getCategoryPlot();
		   CategoryAxis domainAxis = plot.getDomainAxis();//x轴
		   ValueAxis numberaxis = plot.getRangeAxis(); //y轴
           TextTitle t = chart.getTitle();
		   t.setFont(new Font("宋体",Font.BOLD,16));//标题文字
		  
		   domainAxis.setLabelFont(new Font("宋体",Font.BOLD,14));//x轴标题文字
		   domainAxis.setTickLabelFont(new Font("黑体",Font.BOLD,12));//x轴坐标上文字
		   numberaxis.setLabelFont(new Font("宋体",Font.BOLD,14));//y轴标题文字
		   numberaxis.setTickLabelFont(new Font("黑体",Font.BOLD,12));//y轴坐标上文字
//		   chart.getLegend().setItemFont(new Font("黑体",Font.BOLD,12));//图例文字
//		   BarRenderer renderer = (BarRenderer) plot.getRenderer();
//			renderer.setDrawBarOutline(false);
//			renderer.setSeriesPaint(0, new GradientPaint(0.0f, 0.0f, Color.green, 0.0f, 0.0f, Color.lightGray));
//			renderer.setToolTipGenerator(new StandardCategoryToolTipGenerator("{0}={1}",NumberFormat.getNumberInstance()));
//			renderer.setItemURLGenerator(new StandardCategoryURLGenerator("xy_chart.jsp","series","section"));
		 
		 return "barcountbydepart";
	}
	

	/**
	 * 项目状态查询
	 * 
	 * @return
	 */
	public String projectStatus() {
		String Hsql="from ProjectStatusEntity obj where 1=1 ";
		if(null!=projectstatus){
			Hsql=Hsql+" and  obj.status ="+projectstatus.getStatus();
		}
		if(null!=project){
			if (!"".equals(project.getSerialnumbers()))
			Hsql=Hsql+" and obj.projectEntity.serialnumbers like '"+project.getSerialnumbers()+"%'";
		}
		List lsp=publicDao.findObjectListByHsql(Hsql);
		ActionContext.getContext().put("lsp",lsp);
		return "projectstatus";
	}

	/**
	 * 项目详细信息查询
	 * 
	 * @return
	 */
	public String projectDetail() {

		return "projectdetail";
	}

	/**
	 * 项目进度查询
	 * 
	 * @return
	 */
	public String projectProgress() {
		return "projectprogess";
	}

	public ProjectEntity getProject() {
		return project;
	}

	public void setProject(ProjectEntity project) {
		this.project = project;
	}

	public ProjectStatusEntity getProjectstatus() {
		return projectstatus;
	}

	public void setProjectstatus(ProjectStatusEntity projectstatus) {
		this.projectstatus = projectstatus;
	}

	public ProjectArrangementEntity getPaentity() {
		return paentity;
	}

	public void setPaentity(ProjectArrangementEntity paentity) {
		this.paentity = paentity;
	}

	public ProjectDepartArrangementEntity getPdaentity() {
		return pdaentity;
	}

	public void setPdaentity(ProjectDepartArrangementEntity pdaentity) {
		this.pdaentity = pdaentity;
	}

	public String getChargeperson() {
		return chargeperson;
	}

	public void setChargeperson(String chargeperson) {
		this.chargeperson = chargeperson;
	}

	public String getDepartids() {
		return departids;
	}

	public void setDepartids(String departids) {
		this.departids = departids;
	}

	public String getIsdel() {
		return isdel;
	}

	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}

	public JFreeChart getChart() {
		return chart;
	}

	public void setChart(JFreeChart chart) {
		this.chart = chart;
	}

}
