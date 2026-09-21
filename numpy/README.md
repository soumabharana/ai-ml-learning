# NumPy

My NumPy learning work from the AI/ML course, using Google Colab notebooks.

## Structure

- `coursework/` — class notebooks and practice work.
- `projects/` — future original NumPy projects.

## Current Progress

NumPy has now been started as the next stage of the course.

Current uploaded coursework:
- `AI_&_ML_4_1.ipynb`

The current notebook focuses on the foundations of NumPy arrays and vectorized arithmetic.

## Current Coursework

### `AI_&_ML_4_1.ipynb`

Topics practiced in the uploaded notebook:

- Creating NumPy arrays with `np.array()`
- Converting Python lists and nested lists into `numpy.ndarray`
- Comparing Python-list operations with NumPy array operations
- Element-wise addition, subtraction and multiplication
- Scalar arithmetic such as adding, subtracting and dividing by a number
- Element-wise powers
- Creating arrays with `np.zeros()`
- Creating arrays with `np.ones()`
- Creating sequences with `np.arange()`
- Creating evenly spaced values with `np.linspace()`
- Working with one-dimensional and two-dimensional arrays
- Understanding why vectorized NumPy operations are different from normal Python-list operations

The notebook also includes simple error demonstrations showing that expressions such as `marks + 5` or list-to-list multiplication do not behave like NumPy array arithmetic.

## Skills Built So Far

### Array Basics
- `np.array()`
- `numpy.ndarray`
- One-dimensional arrays
- Two-dimensional arrays
- Nested-list conversion

### Array Creation
- `np.zeros()`
- `np.ones()`
- `np.arange()`
- `np.linspace()`

### Vectorized Arithmetic
- Array + scalar
- Array - scalar
- Array / scalar
- Array + array
- Array - array
- Array * array
- Array powers

## Learning Focus

The important transition in this first NumPy work is from manually looping through Python lists to performing operations directly on arrays.

For example:

```python
for i in a:
    b.append(i * 2)
```

becomes:

```python
b = np.array(a) * 2
```

This is the foundation for the numerical and data-manipulation work that comes later in the AI/ML course.

## Course Context

NumPy is the next major section after the SQL block. It provides the numerical-array foundation used later for data analysis, statistics and machine learning workflows.

## Current Status

SQL Window Functions became difficult enough that I paused that section during counselling and moved to NumPy. I plan to return to SQL later after revising the earlier SQL material.