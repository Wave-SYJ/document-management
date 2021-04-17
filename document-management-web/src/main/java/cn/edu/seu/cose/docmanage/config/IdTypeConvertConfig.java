package cn.edu.seu.cose.docmanage.config;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

@MappedTypes(UUID.class)
public class IdTypeConvertConfig extends BaseTypeHandler<UUID> {
    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, UUID parameter, JdbcType jdbcType) throws SQLException {
        ps.setString(i, parameter.toString().replace("-", ""));
    }

    @Override
    public UUID getNullableResult(ResultSet rs, String columnName) throws SQLException {
        return uuid(rs.getString(columnName));
    }

    @Override
    public UUID getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return uuid(rs.getString(columnIndex));
    }

    @Override
    public UUID getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        return uuid(cs.getString(columnIndex));
    }

    private UUID uuid(String str) {
        if (str == null || str.length() < 32)
            return null;
        return UUID.fromString(
                String.format("%s-%s-%s-%s-%s",
                        str.substring(0, 8),
                        str.substring(8, 12),
                        str.substring(12, 16),
                        str.substring(16, 20),
                        str.substring(20, 32))
        );
    }
}
