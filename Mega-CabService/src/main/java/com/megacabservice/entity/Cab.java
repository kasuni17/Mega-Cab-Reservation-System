package com.megacabservice.entity;

public class Cab {
    private int id;
    private String name;
    private String image;
    private String description;
    private String capacity;
    private String useCase;
    private String fareRange;

    // Constructor
    public Cab(int id, String name, String image, String description, String capacity, String useCase, String fareRange) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.description = description;
        this.capacity = capacity;
        this.useCase = useCase;
        this.fareRange = fareRange;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getCapacity() { return capacity; }
    public void setCapacity(String capacity) { this.capacity = capacity; }

    public String getUseCase() { return useCase; }
    public void setUseCase(String useCase) { this.useCase = useCase; }

    public String getFareRange() { return fareRange; }
    public void setFareRange(String fareRange) { this.fareRange = fareRange; }
}