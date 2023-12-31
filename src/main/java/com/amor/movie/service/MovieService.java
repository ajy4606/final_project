package com.amor.movie.service;

import com.amor.movie.model.*;
import com.amor.movieReview.model.MovieReviewDTO;

import java.util.*;

public interface MovieService {

	public int movieAdd(MovieDTO dto);
	
	public List<MovieDTO> movieList(int cp, int listSize);
	
	public MovieDTO movieContent(int movie_idx);
	
	public int movieUpdate(MovieDTO dto);
	
	public int movieDelete(int movie_idx);
	
	public int getTotalCnt();
	
	public int getTotalSearchCnt(String search);
	
	public List<MovieDTO> movieListSearch(int cp, int listSize, String search);
	
	public int stateChange(MovieDTO dto);
	
	public List<MovieDTO> movieBest();
	
	public List<MovieDTO> movieBestReview();
	
	public int movieBestCnt();
	
	public List<MovieDTO> movieCome();
	
	public List<MovieDTO> movieName();
	
	public int movieComeCnt();
	
	public int getUserSearchTotalCnt(String userSearch);
	
	public List<MovieDTO> userMovieSearch(String userSearch, int cp, int listSize);
	
	public List<MovieReviewDTO> movieReviewInfo(int movie_idx, int cp, int listSize);
	
	public int movieReviewContentCnt(int movie_idx);
	
	public List<MovieDTO> indexMovieBest();
	
}
