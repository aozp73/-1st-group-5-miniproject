package shop.mtcoding.job.model.apply;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.job.dto.apply.ApplyRespDto.ApplyListForEntRespDto;
import shop.mtcoding.job.dto.apply.ApplyRespDto.ApplyListForUserRespDto;

@Mapper
public interface ApplyRepository {
        public List<Apply> findAll();

        public List<Apply> findById(int id);

        public int insert(@Param("userId") int userId, @Param("enterpriseId") int enterpriseId,
                        @Param("recruitmentPostId") int recruitmentPostId,
                        @Param("sector") String sector, @Param("resumeId") int resumeId,
                        @Param("createdAt") Timestamp createdAt);

        public int updateById(Apply apply);

        public int deleteById(int id);

        public Apply findByUserIdWithRecruitmentPostId(@Param("userId") int userId,
                        @Param("recruitmentPostId") int recruitmentPostId);

        public Apply findByIdWithEnterpriseId(@Param("id") int id,
                        @Param("enterpriseId") int enterpriseId);

        public int deleteByUserIdWithRecruitmentPostId(@Param("userId") int userId,
                        @Param("recruitmentPostId") int recruitmentPostId);

        public List<ApplyListForUserRespDto> findByUserId(int UserId);

        public List<ApplyListForEntRespDto> findByEnterpriseId(int enterpriseId);

        public int updateResultById(@Param("id") int id, @Param("result") boolean result);
}
