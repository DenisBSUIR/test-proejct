package com.kovalskiy.testproject.model;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "responses")
public class Response {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Id;

    @CollectionTable(name = "field_response", joinColumns = @JoinColumn(name = "response_id"))
    @MapKeyColumn(name = "field_id")
    private HashMap<Long, String> fieldResponse = new HashMap<>();

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public HashMap<Long, String> getFieldResponse() {
        return fieldResponse;
    }

    public void setFieldResponse(HashMap<Long, String> fieldResponse) {
        this.fieldResponse = fieldResponse;
    }
}
