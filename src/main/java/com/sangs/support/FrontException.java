package com.sangs.support;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.exception.EgovBizException;

@SuppressWarnings("serial")
public class FrontException extends EgovBizException {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    public FrontException() {
    }

    public FrontException(String msg) {
    }

    public FrontException(Exception e) {
    }
}
