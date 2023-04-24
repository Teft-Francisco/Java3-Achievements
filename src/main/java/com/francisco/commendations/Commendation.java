package com.francisco.commendations;

import javax.sql.RowSet;

public class Commendation implements Comparable<Commendation>, Cloneable{
    private String title;
    private String description;
    private String[] requirements;
    private String faction;

    public Commendation(String title, String description, String[] requirements, String faction) {
        this.title = title;
        this.description = description;
        this.requirements = requirements;
        this.faction = faction;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String[] getRequirements() {
        return requirements;
    }

    public void setRequirements(String[] requirements) {
        this.requirements = requirements;
    }

    public String getFaction() {
        return faction;
    }

    public void setFaction(String faction) {
        this.faction = faction;
    }

    @Override
    public int compareTo(Commendation o) {
        return this.title.compareTo(o.title);
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}


