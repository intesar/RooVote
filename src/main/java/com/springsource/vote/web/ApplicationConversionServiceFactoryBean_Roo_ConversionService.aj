// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.vote.web;

import com.springsource.vote.domain.Choice;
import com.springsource.vote.domain.Vote;
import com.springsource.vote.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Choice, String> ApplicationConversionServiceFactoryBean.getChoiceToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.springsource.vote.domain.Choice, java.lang.String>() {
            public String convert(Choice choice) {
                return new StringBuilder().append(choice.getNamingChoice()).append(' ').append(choice.getDescription()).toString();
            }
        };
    }
    
    public Converter<Long, Choice> ApplicationConversionServiceFactoryBean.getIdToChoiceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.springsource.vote.domain.Choice>() {
            public com.springsource.vote.domain.Choice convert(java.lang.Long id) {
                return Choice.findChoice(id);
            }
        };
    }
    
    public Converter<String, Choice> ApplicationConversionServiceFactoryBean.getStringToChoiceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.springsource.vote.domain.Choice>() {
            public com.springsource.vote.domain.Choice convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Choice.class);
            }
        };
    }
    
    public Converter<Vote, String> ApplicationConversionServiceFactoryBean.getVoteToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.springsource.vote.domain.Vote, java.lang.String>() {
            public String convert(Vote vote) {
                return new StringBuilder().append(vote.getIp()).append(' ').append(vote.getRegistered()).toString();
            }
        };
    }
    
    public Converter<Long, Vote> ApplicationConversionServiceFactoryBean.getIdToVoteConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.springsource.vote.domain.Vote>() {
            public com.springsource.vote.domain.Vote convert(java.lang.Long id) {
                return Vote.findVote(id);
            }
        };
    }
    
    public Converter<String, Vote> ApplicationConversionServiceFactoryBean.getStringToVoteConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.springsource.vote.domain.Vote>() {
            public com.springsource.vote.domain.Vote convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Vote.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getChoiceToStringConverter());
        registry.addConverter(getIdToChoiceConverter());
        registry.addConverter(getStringToChoiceConverter());
        registry.addConverter(getVoteToStringConverter());
        registry.addConverter(getIdToVoteConverter());
        registry.addConverter(getStringToVoteConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
