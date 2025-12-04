-- 创建用户表
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID（主键）',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `id_number` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `sex` char(1) DEFAULT NULL COMMENT '用户性别',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像地址',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `status` char(1) DEFAULT NULL COMMENT '账号状态',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标志',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 创建医生表
CREATE TABLE `doctor` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `hire_date` date DEFAULT NULL COMMENT '入职时间',
  `brief_introduction` varchar(255) DEFAULT NULL COMMENT '简介',
  `fee` decimal(10,2) DEFAULT NULL COMMENT '看诊费用',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='医生表';

-- 创建患者表
CREATE TABLE `patient` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `balance` decimal(10,2) DEFAULT NULL COMMENT '账户余额',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='患者表';

-- 创建医生排班表
CREATE TABLE `schedule` (
  `id` bigint(20) NOT NULL COMMENT '排班ID（主键）',
  `doc_id` bigint(20) DEFAULT NULL COMMENT '医生ID',
  `quantity` int(3) DEFAULT NULL COMMENT '看诊数量',
  `schedule_date` datetime DEFAULT NULL COMMENT '排班日期',
  PRIMARY KEY (`id`),
  KEY `idx_doc_id` (`doc_id`),
  KEY `idx_schedule_date` (`schedule_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='医生排班表';

-- 创建患者预约表
CREATE TABLE `appointment` (
  `id` bigint(20) NOT NULL COMMENT '预约ID（主键）',
  `pat_id` bigint(20) DEFAULT NULL COMMENT '患者ID',
  `schedule_id` bigint(20) DEFAULT NULL COMMENT '排班ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `status` char(2) DEFAULT NULL COMMENT '预约状态',
  `case_history_content` longblob COMMENT '病历内容',
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`),
  KEY `idx_pat_id` (`pat_id`),
  KEY `idx_schedule_id` (`schedule_id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='患者预约表';

-- 创建缴费订单表
CREATE TABLE `order` (
  `id` bigint(20) NOT NULL COMMENT '订单ID（主键）',
  `subject` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `trade_no` bigint(20) DEFAULT NULL COMMENT '订单号',
  `alipay_trade_no` varchar(64) DEFAULT NULL COMMENT '支付宝订单号',
  `type` varchar(20) DEFAULT NULL COMMENT '订单类型',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '总金额',
  `mode` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `status` varchar(20) DEFAULT NULL COMMENT '订单状态',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`),
  KEY `idx_trade_no` (`trade_no`),
  KEY `idx_create_by` (`create_by`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='缴费订单表';

-- 创建通知公告表
CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL COMMENT '公告ID（主键）',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT NULL COMMENT '公告状态',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';