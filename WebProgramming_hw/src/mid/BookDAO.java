
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookDAO {

    private static Book getbookFrom(ResultSet resultSet) throws SQLException {
        Book book = new Book();
        book.setId(resultSet.getInt("id"));
        book.setTitle(resultSet.getString("title"));
        book.setAuthor(resultSet.getString("author"));
        book.setCategoryId(resultSet.getInt("categoryId"));
        book.setPrice(resultSet.getInt("price"));
        book.setPublisher(resultSet.getString("publisher"));
        return book;
    }


}

