package com.kh.samdado.business.model.vo.hotel;

import java.sql.Date;
import java.util.List;

import com.kh.samdado.business.model.vo.rentcar.Car;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode

public class RoomList {
	private List<Room> roomList;
}
