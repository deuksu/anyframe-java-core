/*
 * Copyright 2002-2008 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.anyframe.mip.query.impl.jdbc.setter;

import org.anyframe.query.impl.jdbc.setter.DefaultDynamicSqlParameterSource;

import com.tobesoft.platform.data.Dataset;

/**
 * @author Soyon Lim
 */
public class MiPDataSetSQLParameterSource extends DefaultDynamicSqlParameterSource {

    private Dataset dataset;
    private int rowNum;
    private ColumnValueExtractor columnValueExtractor;

    public MiPDataSetSQLParameterSource(Dataset dataset, int rowNum,
            ColumnValueExtractor columnValueExtractor) {
        this.dataset = dataset;
        this.rowNum = rowNum;
        this.columnValueExtractor = columnValueExtractor;
    }

    public Object getValue(String columnName) {
        Object value =
            columnValueExtractor.getValue(dataset, rowNum, columnName);
        // if (value == null) {
        // value =
        // VariableUtil.getValueString(columnName, new
        // VariableSelector() {
        //
        // public boolean containsKey(String arg0) {
        // return hasValue(arg0);
        // }
        //
        // public String get(String arg0) {
        // return
        // columnValueExtractor.getValue(dataset,
        // rowNum,
        // arg0).toString();
        // }
        // });
        // }
        return value;
    }

    public boolean hasValue(String columnName) {
        return columnValueExtractor.getValue(dataset, rowNum, columnName) != null;
    }

    public interface ColumnValueExtractor {
        Object getValue(Dataset dataset, int rowNum, String columnName);
    }

    public String getTypeName(String arg0) {
        return arg0;
    }
    
    public Dataset getDataset(){
    	return this.dataset;
    }
}
