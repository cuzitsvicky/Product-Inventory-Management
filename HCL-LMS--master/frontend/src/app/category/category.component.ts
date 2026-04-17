import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ApiService } from '../service/api.service';

interface Category {
  id: string;
  name: string;
  productCount?: number;
}

@Component({
  selector: 'app-category',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './category.component.html',
  styleUrl: './category.component.css',
})
export class CategoryComponent implements OnInit {
  categories: Category[] = [];
  categoryName = '';
  message = '';
  isEditing = false;
  editingCategoryId: string | null = null;

  constructor(private apiService: ApiService) {}

  ngOnInit(): void {
    this.getCategories();
  }

  get maxProductCount(): number {
    if (!this.categories?.length) return 1;
    return Math.max(
      ...this.categories.map((c) => Number(c.productCount) || 0),
      1
    );
  }

  // Calculate percentage of max product count for progress bar
  barPercent(c: Category): number {
    const n = Number(c.productCount) || 0;
    return Math.round((n / this.maxProductCount) * 100);
  }

  // Fetch all categories from the backend API
  getCategories(): void {
    this.apiService.getAllCategory().subscribe({
      next: (res: any) => {
        if (res.status === 200) {
          this.categories = res.categories;
        }
      },
      error: (error) => {
        this.showMessage(
          error?.error?.message ||
            error?.message ||
            'Unable to get categories ' + error
        );
      },
    });
  }

  // Create a new category if the name is provided
  addCategory(): void {
    if (!this.categoryName) {
      this.showMessage('Category name is required');
      return;
    }
    this.apiService.createCategory({ name: this.categoryName }).subscribe({
      next: (res: any) => {
        if (res.status === 200) {
          this.showMessage('Category added successfully');
          this.categoryName = '';
          this.getCategories();
        }
      },
      error: (error) => {
        this.showMessage(
          error?.error?.message ||
            error?.message ||
            'Unable to save category ' + error
        );
      },
    });
  }

  // Save changes to an existing category
  editCategory(): void {
    if (!this.editingCategoryId || !this.categoryName) {
      return;
    }
    this.apiService
      .updateCategory(this.editingCategoryId, { name: this.categoryName })
      .subscribe({
        next: (res: any) => {
          if (res.status === 200) {
            this.showMessage('Category updated successfully');
            this.categoryName = '';
            this.isEditing = false;
            this.getCategories();
          }
        },
        error: (error) => {
          this.showMessage(
            error?.error?.message ||
              error?.message ||
              'Unable to edit category ' + error
          );
        },
      });
  }

  // Set the form into edit mode for a specific category
  handleEditCategory(category: Category): void {
    this.isEditing = true;
    this.editingCategoryId = category.id;
    this.categoryName = category.name;
  }

  // Exit edit mode and clear the form
  cancelEdit(): void {
    this.isEditing = false;
    this.editingCategoryId = null;
    this.categoryName = '';
  }

  // Prompt for confirmation and delete a category
  handleDeleteCategory(categoryId: string): void {
    if (window.confirm('Are you sure you want to delete this category?')) {
      this.apiService.deleteCategory(categoryId).subscribe({
        next: (res: any) => {
          if (res.status === 200) {
            this.showMessage('Category deleted successfully');
            this.getCategories();
          }
        },
        error: (error) => {
          this.showMessage(
            error?.error?.message ||
              error?.message ||
              'Unable to delete category ' + error
          );
        },
      });
    }
  }

  // Display a toast message temporarily
  showMessage(message: string) {
    this.message = message;
    setTimeout(() => {
      this.message = '';
    }, 4000);
  }
}
