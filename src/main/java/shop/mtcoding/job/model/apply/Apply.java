package shop.mtcoding.job.model.apply;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.job.util.DateUtil;

@Getter
@Setter
public class Apply {
    private int id;
    private int userId;
    private int enterpriseId;
    private int recruitmentPostId;
    private String sector;
    private int resumeId;
    private Timestamp createdAt;

    public String getCreatedAtToString() {
        return DateUtil.format(createdAt);
    }
}
