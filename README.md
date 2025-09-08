    
# INSC 484: Homework One

This project covers three parts:

* **SQL Queries:** Practice with the *Great British Bakeoff* database to retrieve info about bakers, ingredients, and eliminations.
* **Database Design:** Normalized two sample datasets (sports cards and plants) into relational schemas with justifications.
* **Python Program:** Built a small app to simulate coin flips, dice rolls (6, 8, 10, 12 sides), and card draws (with or without Jokers).



## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/riskgoated/INCS484-HW1.git
   cd INCS484-HW1
   ```

2. Run the program with Python 3:

   ```bash
   python3 main.py
   ```

> 💡 No external dependencies are required — everything uses the Python standard library.

## Database Design Choices

### Q1
The original flat tables contained repeated and multi-valued information (e.g., manufacturer addresses, storage box descriptions, etc), which would cause redundancy, update anomalies, and difficulty in querying. To address this, the database was normalized to Third Normal Form (3NF).

For the card collection inventory, manufacturers and storage boxes were separated into their own tables because multiple items can share the same manufacturer or box. This avoids repeating address and description data, while the Item table stores only card-specific details and foreign keys to these entities. Costs and market values are kept atomic and numeric for accurate calculations.

### Q2
The original table contained repeated information (e.g., the same waterer name and phone number for multiple plants, the same sunlight value for all plants in a location) and multi-valued attributes (watering schedules like “Tuesday, Thursday”). To eliminate redundancy and meet 3NF, the data was split into separate tables: Person for unique waterers, PlantType for canonical plant types, and Location for places with shared sunlight values. Each Plant row represents a single named plant and references these entities with foreign keys, ensuring that every attribute depends only on the key. Multi-day watering schedules were modeled with a bridge table (PlantWaterDay) linked to a canonical DayOfWeek list, making them atomic and queryable. This design avoids update anomalies, keeps data consistent, and makes queries like “which plants are watered on Monday” efficient and reliable.

## Authors

- [@riskgoated](https://www.github.com/riskgoated)


## License

[MIT](https://choosealicense.com/licenses/mit/)

