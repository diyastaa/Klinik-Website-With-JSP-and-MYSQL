package com.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Konsultasi;
import java.io.IOException;
import javax.servlet.http.Part;

public class KonsultasiDAO {

    private final Connection conn;

    public KonsultasiDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean addKonsultasi(Konsultasi ap, InputStream resepContent) {
        boolean f = false;

        try {
            String sql = "INSERT INTO konsul (k_user_id, k_fullname, k_gender, k_age, k_email, k_phno, k_doctor_id, keluhan, respon, resep) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, ap.getKUserId());
                ps.setString(2, ap.getKFullName());
                ps.setString(3, ap.getKGender());
                ps.setString(4, ap.getKAge());
                ps.setString(5, ap.getKEmail());
                ps.setString(6, ap.getKPhNo());
                ps.setInt(7, ap.getKDoctorId());
                ps.setString(8, ap.getKeluhan());
                ps.setString(9, ap.getRespon());
                ps.setBlob(10, resepContent);

                int i = ps.executeUpdate();
                if (i == 1) {
                    f = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return f;
    }



	public List<Konsultasi> getAllKonsultasiByLoginUser(int kuserId) {
    List<Konsultasi> list = new ArrayList<>();
    Konsultasi ap = null;

    try {
        String sql = "SELECT * FROM konsul WHERE k_user_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, kuserId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ap = new Konsultasi();
                    ap.setId(rs.getInt(1));
                    ap.setKUserId(rs.getInt(2));
                    ap.setKFullName(rs.getString(3));
                    ap.setKGender(rs.getString(4));
                    ap.setKAge(rs.getString(5));
                    ap.setKEmail(rs.getString(6));
                    ap.setKPhNo(rs.getString(7));
                    ap.setKDoctorId(rs.getInt(8));
                    ap.setKeluhan(rs.getString(9));
                    ap.setRespon(rs.getString(10));
                    ap.setResep(rs.getBytes(11)); // Set the resep field
                    list.add(ap);
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return list;
}

	public List<Konsultasi> getAllKonsultasiByDoctorLogin(int kdoctorId) {
		List<Konsultasi> list = new ArrayList<>();
		Konsultasi ap = null;

		try {

			String sql = "select * from konsul where k_doctor_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, kdoctorId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Konsultasi();
				ap.setId(rs.getInt(1));
				ap.setKUserId(rs.getInt(2));
				ap.setKFullName(rs.getString(3));
				ap.setKGender(rs.getString(4));
				ap.setKAge(rs.getString(5));
				ap.setKEmail(rs.getString(6));
				ap.setKPhNo(rs.getString(7));
				ap.setKDoctorId(rs.getInt(8));
				ap.setKeluhan(rs.getString(9));
				ap.setRespon(rs.getString(10));
				list.add(ap);
			}

		} catch (SQLException e) {
                       e.printStackTrace();
		}

		return list;
	}

	public Konsultasi getKonsultasiById(int id) {

		Konsultasi ap = null;

		try {

			String sql = "select * from konsul where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Konsultasi();
				ap.setId(rs.getInt(1));
				ap.setKUserId(rs.getInt(2));
				ap.setKFullName(rs.getString(3));
				ap.setKGender(rs.getString(4));
				ap.setKAge(rs.getString(5));
				ap.setKEmail(rs.getString(6));
				ap.setKPhNo(rs.getString(7));
				ap.setKDoctorId(rs.getInt(8));
				ap.setKeluhan(rs.getString(9));
				ap.setRespon(rs.getString(10));

			}

		} catch (SQLException e) {
                       e.printStackTrace();
		}

		return ap;
	}

	public boolean updateCommentStatus(int id, int kdoctId, String comm, InputStream resepStream) {
    boolean f = false;
    try {
        String sql = "UPDATE konsul SET respon=?, resep=? WHERE id=? AND k_doctor_id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, comm);
        ps.setBlob(2, resepStream);
        ps.setInt(3, id);
        ps.setInt(4, kdoctId);

        int i = ps.executeUpdate();
        if (i == 1) {
            f = true;
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Handle the exception appropriately
    }

    return f;
}

	public List<Konsultasi> getAllKonsultasi() {
		List<Konsultasi> list = new ArrayList<>();
		Konsultasi ap = null;

		try {

			String sql = "select * from konsul order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Konsultasi();
				ap.setId(rs.getInt(1));
				ap.setKUserId(rs.getInt(2));
				ap.setKFullName(rs.getString(3));
				ap.setKGender(rs.getString(4));
				ap.setKAge(rs.getString(5));
				ap.setKEmail(rs.getString(6));
				ap.setKPhNo(rs.getString(7));
				ap.setKDoctorId(rs.getInt(8));
				ap.setKeluhan(rs.getString(9));
				ap.setRespon(rs.getString(10));
				list.add(ap);
			}

		} catch (SQLException e) {
		}

		return list;
	}


}