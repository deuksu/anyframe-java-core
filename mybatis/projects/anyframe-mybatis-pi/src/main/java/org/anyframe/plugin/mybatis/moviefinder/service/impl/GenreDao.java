/*
 * Copyright 2008-2012 the original author or authors.
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
package org.anyframe.plugin.mybatis.moviefinder.service.impl;

import java.util.List;

import org.anyframe.plugin.mybatis.domain.Genre;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * This GenreDao class is a DAO class to provide genre list functionality.
 * 
 * @author Jongpil Park
 */
@Repository("mybatisGenreDao")
public class GenreDao extends SqlSessionDaoSupport {

	public List<Genre> getList() {
		return super.getSqlSession().selectList("Genre.getGenreList");
	}

}
