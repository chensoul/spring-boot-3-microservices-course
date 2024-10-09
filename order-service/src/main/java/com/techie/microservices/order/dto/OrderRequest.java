package com.techie.microservices.order.dto;

import java.math.BigDecimal;
import lombok.Data;

public record OrderRequest(Long id, String orderNumber, String skuCode,
                           BigDecimal price, Integer quantity, UserDetails userDetails) {

  @Data
  public static class UserDetails {
    private String email;
    private String firstName;
    private String lastName;
  }
}


