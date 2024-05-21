package com.entity;

public class Konsultasi {
	private int id;
	private int KuserId;
	private String KfullName;
	private String kgender;
	private String kage;
	private String kemail;
	private String kphNo;
	private int kdoctorId;
	private String keluhan;
	private String respon;
            private byte[] resep; // Add a field for longblob (byte[] represents binary data)

	public Konsultasi() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Konsultasi(int KuserId, String KfullName, String kgender, String kage, String kemail,
			String kphNo,  int kdoctorId, String keluhan, String respon) {
		super();
		this.KuserId = KuserId;
		this.KfullName = KfullName;
		this.kgender = kgender;
		this.kage = kage;
		this.kemail = kemail;
		this.kphNo = kphNo;
		this.kdoctorId = kdoctorId;
		this.keluhan = keluhan;
		this.respon = respon;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getKUserId() {
		return KuserId;
	}

	public void setKUserId(int KuserId) {
		this.KuserId = KuserId;
	}

	public String getKFullName() {
		return KfullName;
	}

	public void setKFullName(String KfullName) {
		this.KfullName = KfullName;
	}

	public String getKGender() {
		return kgender;
	}

	public void setKGender(String kgender) {
		this.kgender = kgender;
	}

	public String getKAge() {
		return kage;
	}

	public void setKAge(String kage) {
		this.kage = kage;
	}

	public String getKEmail() {
		return kemail;
	}

	public void setKEmail(String kemail) {
		this.kemail = kemail;
	}

	public String getKPhNo() {
		return kphNo;
	}

	public void setKPhNo(String kphNo) {
		this.kphNo = kphNo;
	}



	public int getKDoctorId() {
		return kdoctorId;
	}

	public void setKDoctorId(int kdoctorId) {
		this.kdoctorId = kdoctorId;
	}

	public String getKeluhan() {
		return keluhan;
	}

	public void setKeluhan(String keluhan) {
		this.keluhan = keluhan;
	}

	public String getRespon() {
		return respon;
	}

	public void setRespon(String respon) {
		this.respon = respon;
	}

   public byte[] getResep() {
        return resep;
    }

    public void setResep(byte[] resep) {
        this.resep = resep;
    }

}