package com.project.careerfair.service.admin;

import java.util.Map;

public interface RecruiterService {
    Map<String, Object> getList(String search, String type, Integer page, String status);
}