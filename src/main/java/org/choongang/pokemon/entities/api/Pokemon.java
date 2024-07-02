package org.choongang.pokemon.entities.api;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.util.List;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class Pokemon {
    private List<Ability> abilities;
    private int base_experience;
    private Cry cries;
    private List<Item> forms;
    private List<GameIndice> game_indices;
    private int height;
    private List<HeldItem> held_items;
    private int id;
    private boolean is_default;
    private String location_area_encounters;
    private List<Move> moves;
    private String name;
    private int order;
    private Item species;
    private Sprite sprites;
    private List<Stat> stats;
    private List<Type> types;
    private int weight;

    @JsonIgnore
    private String rawData;

    @JsonIgnore
    private String nameKr;

    @JsonIgnore
    private String description;

    // 필요한 type name만 반환하는 getter 추가
    @JsonIgnore
    public String getPrimaryTypeName() {
        if (types != null && !types.isEmpty()) {
            return types.get(0).getType().getName(); // 첫 번째 타입의 이름을 반환
        }
        return null;
    }

    @JsonIgnore
    public String getSecondaryTypeName() {
        if (types != null && types.size() > 1) {
            return types.get(1).getType().getName(); // 두 번째 타입의 이름을 반환
        }
        return null;
    }
}
