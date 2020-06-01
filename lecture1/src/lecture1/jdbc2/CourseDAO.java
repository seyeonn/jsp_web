package lecture1.jdbc2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lecture1.DB;

public class CourseDAO {

    private static Course getCourseFrom(ResultSet resultSet) throws SQLException {
        Course course = new Course();
        course.setId(resultSet.getInt("id"));
        course.setCourseName(resultSet.getString("courseName"));
        course.setDepartmentId(resultSet.getInt("departmentId"));
        course.setUnit(resultSet.getInt("unit"));
        course.setProfessorId(resultSet.getInt("professorId"));
        course.setStartDate(resultSet.getString("startDate"));
        course.setDepartmentName(resultSet.getString("departmentName"));
        course.setProfessorName(resultSet.getString("professorName"));
        return course;
    }

    public static List<Course> findAll() throws Exception {
        String sql = "SELECT c.*, d.departmentName, p.professorName" +
                     " FROM course c LEFT JOIN department d ON c.departmentId = d.id" +
                     " LEFT JOIN professor p ON c.professorId = p.id";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            ArrayList<Course> list = new ArrayList<Course>();
            while (resultSet.next())
                list.add(getCourseFrom(resultSet));
            return list;
        }
    }

    public static Course findByCourseName(String courseName) throws Exception {
        String sql = "SELECT c.*, d.departmentName, p.professorName" +
                     " FROM course c LEFT JOIN department d ON c.departmentId = d.id" +
                     " LEFT JOIN professor p ON c.professorId = p.id " +
                     " WHERE c.courseName = ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, courseName);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next())
                    return getCourseFrom(resultSet);
                else
                    return null;
            }
        }
    }

    public static Course findById(int id) throws Exception {
        String sql = "SELECT c.*, d.departmentName, p.professorName" +
                     " FROM course c LEFT JOIN department d ON c.departmentId = d.id" +
                     " LEFT JOIN professor p ON c.professorId = p.id " +
                     " WHERE c.id = ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next())
                    return getCourseFrom(resultSet);
                else
                    return null;
            }
        }
    }

    public static void insert(Course course) throws Exception {
        String sql = "INSERT course (courseName, departmentId, unit, professorId, startDate)" +
                     " VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, course.getCourseName());
            statement.setInt(2, course.getDepartmentId());
            statement.setInt(3, course.getUnit());
            statement.setInt(4, course.getProfessorId());
            statement.setString(5, course.getStartDate());
            statement.executeUpdate();
        }
    }


    public static void update(Course course) throws Exception {
        String sql = "UPDATE course SET courseName=?, departmentId=?, unit=?, professorId=?, startDate=? " +
                     " WHERE id = ?";
        try (Connection connection = DB.getConnection("Course");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, course.getCourseName());
            statement.setInt(2, course.getDepartmentId());
            statement.setInt(3, course.getUnit());
            statement.setInt(4, course.getProfessorId());
            statement.setString(5, course.getStartDate());
            statement.setInt(6, course.getId());
            statement.executeUpdate();
        }
    }
}

