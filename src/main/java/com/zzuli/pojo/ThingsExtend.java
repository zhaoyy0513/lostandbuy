package com.zzuli.pojo;

import java.util.ArrayList;
import java.util.List;

public class ThingsExtend {
    private Thing thing;
    private List<Image> image= new ArrayList<Image>();

	public Thing getThing() {
		return thing;
	}
	public void setThing(Thing thing) {
		this.thing= thing;
	}
	public List<Image> getImage() {
		return image;
	}
	public void setImage(List<Image> image) {
		this.image = image;
	}
}