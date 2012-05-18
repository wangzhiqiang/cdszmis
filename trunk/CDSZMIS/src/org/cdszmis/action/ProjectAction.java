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
import org.cdszmis.service.DepartService;
import org.cdszmis.service.ProjectService;
import org.cdszmis.service.UserService;
import org.cdszmis.utils.HibernateUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
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
	@Resource HibernateUtils hibernateUtils;
	@Resource private ProjectService projectservice;
	@Resource private  DepartService  departService;
	@Resource private UserService userService;
	private ProjectEntity project;
	@Resource private PublicDao  publicDao;
	private ProjectStatusEntity projectstatus;
	ProjectArrangementEntity paentity;
	ProjectDepartArrangementEntity pdaentity;
	private String chargeperson;
	private String departids;
	private Integer id;
	private JFreeChart chart;
	public String projectmanage(){
		if(project!=null){
			
				projectservice.projectManage(project);
		}
		List <ProjectEntity>  plist = projectservice.projectList();
		ActionContext.getContext().put("allproject", plist);
		return "add";
	}
			

	public String findallProject(){
		List<ProjectEntity> plist = projectservice.projectList();
		ActionContext.getContext().put("allproject", plist);
		return "listproject";
	}
	    //（分派项目）安排部门后，项目状态为＂任务下达0＂
	@SuppressWarnings("unchecked")
	public String  arrangeDepartids(){
		ActionContext.getContext().getSession().put("departlist", departService.departList());
        if(paentity!=null){
			ProjectEntity  pro = new ProjectEntity();
			pro = (ProjectEntity)publicDao.queryObject(ProjectEntity.class,paentity.getProjectid());
			try
			{	
				projectstatus=new ProjectStatusEntity();
				projectstatus.setProjectEntity(pro);
				projectstatus.setStatus(0);
				publicDao.saveOrupdateObject(projectstatus);
				paentity.setProjectEntity(pro);
				publicDao.saveOrupdateObject(paentity);

			} catch(Exception e) 
			{
				e.printStackTrace();
			}
		}
          //查询所有在安排表中没有的项目 
		List <ProjectEntity> plist= publicDao.findObjectListByHsql("select distinct obj from ProjectEntity obj  where obj.id not in (select obj1.projectEntity.id from ProjectStatusEntity obj1 )");
		ActionContext.getContext().put("allnoarrangdepart", plist);
		return "arrangedepart";	
		}
	     //（所级安排）安排负责人后，项目状态为“方案1” ---查询只能是被人所在部门的
	@SuppressWarnings("unchecked")
	public String arrangePerson(){
		//查询并显示
		ActionContext.getContext().getSession().put("userlist", userService.selectList(null));
		if(pdaentity!=null){
			ProjectEntity  pro = new ProjectEntity();
			pro = (ProjectEntity)publicDao.queryObject(ProjectEntity.class, pdaentity.getProjectid());
			projectstatus = (ProjectStatusEntity) hibernateUtils.findobjByHsql("select s from ProjectStatusEntity,ProjectEntity p where s.projectentity.id=p.id and p.id= "+pdaentity.getProjectid());
			try {
				projectstatus.setProjectEntity(pro);
				projectstatus.setStatus(1);
				publicDao.saveOrupdateObject(projectstatus);
				pdaentity.setProjectEntity(pro);
				publicDao.saveOrupdateObject(pdaentity);
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		//查询所有状态为“任务下达0”的项目
		List <ProjectEntity> plist = publicDao.findObjectListByHsql("select distinct obj.projectEntity from ProjectStatusEntity obj where obj.status=0");
		ActionContext.getContext().put("allnoarrangperson", plist);
		return "arrangeperson";
	}
	
	

	public String projectImpl(){
		if(projectstatus!=null){
			projectservice.changeStatus(projectstatus);
		}
		List<ProjectEntity> plist = projectservice.implStatusList();
		ActionContext.getContext().put("allnoimplpro", plist);
		return "projectimpl";
	}
	public String projectCheck()  {
		if(projectstatus!=null){	
				projectservice.changeStatus(projectstatus);
			
		}
		List<ProjectEntity> plist = projectservice.checkStatusList();
		ActionContext.getContext().put("allnocheckpro", plist);
		return "projectcheck";
	}

	public String projectSign(){
		if(projectstatus!=null){
		
			projectservice.changeStatus(projectstatus);
		
		}
		List<ProjectEntity> plist = projectservice.signStatusList();
		ActionContext.getContext().put("allnosignpro", plist);
		return "projectsign";
	}
	
	public String projectPublic(){
		if(projectstatus!=null){
		
			projectservice.changeStatus(projectstatus);
		
		}
		List<ProjectEntity> plist = projectservice.publicStatusList();
		ActionContext.getContext().put("allnopublicpro", plist);
		return "projectpublic";
	}
	public String projectSale(){
		if(projectstatus!=null){
			projectservice.changeStatus(projectstatus);
		}
		List<ProjectEntity> plist = projectservice.saleStatusList();
		ActionContext.getContext().put("allnosalepro", plist);
		return "projectsale";
	}
	public String projectFilling(){
		if(projectstatus!=null){
		
			projectservice.changeStatus(projectstatus);
		
		}
		List<ProjectEntity> plist = projectservice.fillStatusList();
		ActionContext.getContext().put("allnofillpro", plist);
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
	//按部门查询的柱状图action
	public  String barPic(){
		
		//dataset的数据处理start
		
		//select count(d.departname) ,d.departname from tb_depart  d,tb_projectarrangement pa where pa.departids=d.id group by d.departname
//		String HSQL="from ProjectArrangementEntity ";//obj where obj.departids like '%"+1+"%'";
		//项目安排信息
//		List lsp=publicDao.findObjectListByHsql(HSQL);
//		
//		Map<Integer,String> map=new HashedMap();
//		
//		ProjectArrangementEntity pae=null ;
//		DepartmentEntity depart=null;
//		
//		List <DepartmentEntity> lsd=new ArrayList <DepartmentEntity>();
//		for(int i=0;i<lsp.size();i++){
//			 pae=new ProjectArrangementEntity();
//			 pae=(ProjectArrangementEntity) lsp.get(i);
//			 depart=new DepartmentEntity();
//			 if(null!=pae.getDepartids()&&!"".equals(pae.getDepartids())){
//			 depart=(DepartmentEntity) publicDao.queryObject(DepartmentEntity.class,Integer.valueOf(pae.getDepartids()));
//			 lsd.add(depart);
//			 }
//		}
//		Map<Integer,String[]> cmap=new HashedMap();
//		String str[] = new String[3];
// 
//		 DefaultCategoryDataset dataset = new DefaultCategoryDataset();
//		 for(int j=0;j<lsd.size();j++){
//			 if(cmap.size()>0){
//				 String s[]=new String[3];
//				 s=cmap.get(lsd.get(j).getId());
//	//			 System.out.println(s[0]+"--"+s[1]+"--"+s[2]);
//				 if(null==s){
//					 s =new String[3];
//					 s[0]=String.valueOf(lsd.get(j).getId());
//					 s[1]=lsd.get(j).getDepartname();
//					 s[2]="1";
//					 cmap.put(lsd.get(j).getId(),s);
//				 }else{
//					 s[2]=String.valueOf((Integer.valueOf(s[2])+1));
//					 cmap.put(lsd.get(j).getId(),s);
//				 }
//			 }else{
//				 str[0]=String.valueOf(lsd.get(j).getId());
//				 str[1]=lsd.get(j).getDepartname();
//				 str[2]="1";
//				 cmap.put(lsd.get(j).getId(),str);
//			 }
//			 
//		 }
//		 
//		 Set<Integer> st=cmap.keySet();
//		 
//		 Iterator <Integer> it=st.iterator();
//		 while(it.hasNext()){
//			
//			 Integer in= it.next() ;
//			 dataset.addValue(Integer.valueOf(cmap.get(in)[2]),"",cmap.get(in)[1]);
//		 }
		 //dataset数据处理end
		//新dataset数据处理
		List  dd=publicDao.findObjectListByHsql("select count(obj.departname),obj.departname from DepartmentEntity obj ,ProjectArrangementEntity obj1 where obj.id=obj1.departids group by obj.departname");
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		for(int l=0 ;l<dd.size();l++)
		{
			  Object[] obj = (Object []) dd.get(l);
			   dataset.addValue(Integer.valueOf(obj[0].toString()), obj[1].toString(),"");
		}
		chart = ChartFactory.createBarChart3D(
				"部门项目分配情况", // 图表标题
				"部门信息", // 目录轴的显示标签
				"部门安排项目数", // 数值轴的显示标签
				dataset, // 数据集
				PlotOrientation.VERTICAL, // 图表方向：水平、垂直
				true, 	// 是否显示图例(对于简单的柱状图必须是false)
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
		   chart.getLegend().setItemFont(new Font("黑体",Font.BOLD,12));//图例文字
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
		String Hsql="from ProjectStatusEntity obj where 1=1 ";
		//System.out.println(Hsql);
		if(null!=projectstatus){
			Hsql=Hsql+" and  obj.status ="+projectstatus.getStatus();
		}
		if(null!=project){
			if (!"".equals(project.getSerialnumbers()))
			Hsql=Hsql+" and obj.projectEntity.serialnumbers like '"+project.getSerialnumbers()+"%'";
			if (!"".equals(project.getPrijectname()))
				Hsql=Hsql+" and obj.projectEntity.prijectname like '"+project.getPrijectname()+"%'";
		}
		
		
		
		List lsp=publicDao.findObjectListByHsql(Hsql);
		ActionContext.getContext().put("lsp",lsp);

		return "projectdetail";
	}

	/**
	 * 项目进度查询
	 * 
	 * @return
	 */
	public String projectProgress() {
		String Hsql="from ProjectStatusEntity obj where 1=1 ";
		//System.out.println(Hsql);
		if(null!=projectstatus){
			Hsql=Hsql+" and  obj.status ="+projectstatus.getStatus();
		}
		if(null!=project){
			if (!"".equals(project.getSerialnumbers()))
			Hsql=Hsql+" and obj.projectEntity.serialnumbers like '"+project.getSerialnumbers()+"%'";
	
			if (!"".equals(project.getPrijectname()))
			Hsql=Hsql+" and obj.projectEntity.prijectname like '"+project.getPrijectname()+"%'";
		}
		System.out.println(Hsql);
		List lsp=publicDao.findObjectListByHsql(Hsql);
		ActionContext.getContext().put("lsp",lsp);
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
 
	public int getId() {
		return id;
	}
 
	public JFreeChart getChart() {
		return chart;
	}
 

	public void setId(int id) {
		this.id = id;
	}
 
	public void setChart(JFreeChart chart) {
		this.chart = chart;
	}
 
}
