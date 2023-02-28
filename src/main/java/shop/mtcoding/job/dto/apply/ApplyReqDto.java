package shop.mtcoding.job.dto.apply;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.job.util.DateUtil;

public class ApplyReqDto {
    @Setter
    @Getter
    public static class InsertApplyReqDto {
        private int enterpriseId;
        private int recruitmentPostId;
        private String sector;
        private int resumeId;
        private Timestamp createdAt;

        public String getCreatedAtToString() {
            return DateUtil.format(createdAt);
        }
    }
}