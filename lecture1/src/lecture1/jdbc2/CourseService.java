package lecture1.jdbc2;

import lecture1.utils.StringUtil;

public class CourseService {

    static final String 강좌명_필수 = "강좌명을 입력하세요";
    static final String 개설학과_필수 = "개설학과를 입력하세요";
    static final String 담당교수_필수 = "담당교수를 입력하세요";
    static final String 학점_오류 = "학점은 1 이상 6 이하이어야 합니다";
    static final String 강좌명_중복 = "강좌명이 중복됩니다";


    static String validate(Course course) throws Exception {
        if (StringUtil.isEmptyOrBlank(course.getCourseName()))
            return 강좌명_필수;
        if (course.getDepartmentId() == 0)
            return 개설학과_필수;
        if (course.getProfessorId() == 0)
            return 담당교수_필수;
        if (course.getUnit() < 1 || course.getUnit() > 6)
            return 학점_오류;
        Course course1 = CourseDAO.findByCourseName(course.getCourseName());
        if (course1 != null && course1.getId() != course.getId())
            return 강좌명_중복;
        return null;
    }

    public static String insert(Course course) throws Exception {
        String errorMessage = validate(course);
        if (errorMessage != null) return errorMessage;
        CourseDAO.insert(course);
        return null;
    }

    public static String update(Course course) throws Exception {
        String errorMessage = validate(course);
        if (errorMessage != null) return errorMessage;
        CourseDAO.update(course);
        return null;
    }
}

